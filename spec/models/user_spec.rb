require 'rails_helper'
describe User do
  it "nicknameがない場合は登録できないこと" do
    user = build(:user, nickname: nil)
    user.valid?
    expect(user.errors[:nickname]).to include("translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank")
  end

  it "nicknameが20文字以上の場合は登録できないこと" do
    user = build(:user, nickname: "テストテストテストテストテストテストテスト")
    user.valid?
    expect(user.errors[:nickname]).to include("translation missing: ja.activerecord.errors.models.user.attributes.nickname.too_long")
  end

  it "emailがない場合は登録できないこと" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.blank")
  end

  it "emailに@ドメインがない場合は登録できないこと" do
    user = build(:user, email: "testtesttest")
    user.valid?
    expect(user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.invalid")
  end

  it "重複したemailが存在する場合は登録できないこと" do
    user = create(:user)
    another_user = build(:user, email: user.email)
    another_user.valid?
    expect(another_user.errors[:email]).to include("translation missing: ja.activerecord.errors.models.user.attributes.email.taken")
  end

  it "passwordがない場合は登録できないこと" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.blank")
  end

  it "passwordが6文字以下の場合は登録できないこと" do
    user = build(:user, password: "aaaaa1")
    user.valid?
    expect(user.errors[:password]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password.too_short")
  end

  it "passwordが7文字以上の場合は登録できること" do
    user = build(:user, password: "aaaaaa1", password_confirmation: "aaaaaa1")
    user.valid?
    expect(user).to be_valid
  end

  it "passwordが英語のみの場合は登録できないこと" do
    user = build(:user, password: "aaaaaaa", password_confirmation: "aaaaaaa")
    user.valid?
    expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
  end

  it "passwordが数字のみの場合は登録できないこと" do
    user = build(:user, password: "1111111", password_confirmation: "1111111")
    user.valid?
    expect(user.errors[:password]).to include("は英字と数字両方を含むパスワードを設定してください")
  end

  it "passwordがあってもpassword_confirmationがない場合は登録できないこと" do
    user = build(:user, password_confirmation: "")
    user.valid?
    expect(user.errors[:password_confirmation]).to include("translation missing: ja.activerecord.errors.models.user.attributes.password_confirmation.confirmation")
  end

  it "postal_codeがない場合は登録できないこと" do
    user = build(:user, postal_code: nil)
    user.valid?
    expect(user.errors[:postal_code]).to include("translation missing: ja.activerecord.errors.models.user.attributes.postal_code.blank")
  end

  it "municipalityがない場合は登録できないこと" do
    user = build(:user, municipality: nil)
    user.valid?
    expect(user.errors[:municipality]).to include("translation missing: ja.activerecord.errors.models.user.attributes.municipality.blank")
  end

  it "addressがない場合は登録できないこと" do
    user = build(:user, address: nil)
    user.valid?
    expect(user.errors[:address]).to include("translation missing: ja.activerecord.errors.models.user.attributes.address.blank")
  end

  it "family_nameがない場合は登録できないこと" do
    user = build(:user, family_name: nil)
    user.valid?
    expect(user.errors[:family_name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.family_name.blank")
  end

  it "user_nameがない場合は登録できないこと" do
    user = build(:user, user_name: nil)
    user.valid?
    expect(user.errors[:user_name]).to include("translation missing: ja.activerecord.errors.models.user.attributes.user_name.blank")
  end

  it "family_name_kanaがない場合は登録できないこと" do
    user = build(:user, family_name_kana: nil)
    user.valid?
    expect(user.errors[:family_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.family_name_kana.blank")
  end

  it "family_name_kanaが全角カタカナの場合は登録できること" do
    user = build(:user, family_name_kana: "フリマ")
    user.valid?
    expect(user).to be_valid
  end

  it "family_name_kanaが全角カタカナ以外の場合は登録できないこと" do
    user = build(:user, family_name_kana: "ふりま太郎")
    user.valid?
    expect(user.errors[:family_name_kana]).to include("全角カタカナのみで入力して下さい")
  end

  it "user_name_kanaがない場合は登録できないこと" do
    user = build(:user, user_name_kana: nil)
    user.valid?
    expect(user.errors[:user_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.user_name_kana.blank")
  end

  it "user_name_kanaが全角カタカナの場合は登録できること" do
    user = build(:user, user_name_kana: "フリマ")
    user.valid?
    expect(user).to be_valid
  end

  it "user_name_kanaが全角カタカナ以外の場合は登録できないこと" do
    user = build(:user, user_name_kana: "ふりま太郎")
    user.valid?
    expect(user.errors[:user_name_kana]).to include("全角カタカナのみで入力して下さい")
  end

  it "destination_family_name_kanaがない場合は登録できないこと" do
    user = build(:user, destination_family_name_kana: nil)
    user.valid?
    expect(user.errors[:destination_family_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.destination_family_name_kana.blank")
  end

  it "destination_family_name_kanaが全角カタカナの場合は登録できること" do
    user = build(:user, destination_family_name_kana: "フリマ")
    user.valid?
    expect(user).to be_valid
  end

  it "destination_family_name_kanaが全角カタカナ以外の場合は登録できないこと" do
    user = build(:user, destination_family_name_kana: "ふりま太郎")
    user.valid?
    expect(user.errors[:destination_family_name_kana]).to include("全角カタカナのみで入力して下さい")
  end

  it "destination_name_kanaがない場合は登録できないこと" do
    user = build(:user, destination_name_kana: nil)
    user.valid?
    expect(user.errors[:destination_name_kana]).to include("translation missing: ja.activerecord.errors.models.user.attributes.destination_name_kana.blank")
  end

  it "destination_name_kanaが全角カタカナの場合は登録できること" do
    user = build(:user, destination_name_kana: "フリマ")
    user.valid?
    expect(user).to be_valid
  end

  it "destination_name_kanaが全角カタカナ以外の場合は登録できないこと" do
    user = build(:user, destination_name_kana: "ふりま太郎")
    user.valid?
    expect(user.errors[:destination_name_kana]).to include("全角カタカナのみで入力して下さい")
  end
end