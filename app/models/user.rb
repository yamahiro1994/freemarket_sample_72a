class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_many :sns_credentials
  has_many :items
  has_many :bookmarks
  has_many :bookmark_items, through: :bookmarks, source: :item
  has_many :users, through: :items

  has_many :comments

  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
  VALID_POSTAL_CODE = /\A\d{7}\z/

  # ユーザー新規登録時のバリデーション

  ## 一般
  validates :nickname,                     presence: true, length: { maximum: 20 }
  validates :email,                        presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX,       message: 'のフォーマットが不適切です'}
  validates :postal_code,                  presence: true, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE, message: 'のフォーマットが不適切です' }
  validates :municipality,                 presence: true, length: { maximum: 50 }
  validates :address,                      presence: true, length: { maximum: 100 }

  ## 名前全角
  validates :family_name,                  presence: true, length: { maximum: 35 }
  validates :user_name,                    presence: true, length: { maximum: 35 }

  ## 名前カナ
  validates :family_name_kana,             presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,       message: "全角カタカナのみで入力して下さい"}
  validates :user_name_kana,               presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,       message: "全角カタカナのみで入力して下さい"}
  validates :destination_family_name_kana, presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,       message: "全角カタカナのみで入力して下さい"}
  validates :destination_name_kana,        presence: true, format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,       message: "全角カタカナのみで入力して下さい"}

  ## パスワード
  validates :password,                     presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
  # validates :password_confirmation,        presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
