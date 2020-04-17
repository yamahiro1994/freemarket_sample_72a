FactoryBot.define do

  factory :user do
    nickname {"テスト"}
    email {"kkk@gmail.com"}
    password {"aaaaaa1"}
    password_confirmation {"aaaaaa1"}
    family_name {"てすと"}
    family_name_kana {"テスト"}
    user_name {"てすと"}
    user_name_kana {"テスト"}
    birthday {"2020-04-15"}
    destination_family_name {"てすと"}
    destination_family_name_kana {"テスト"}
    destination_name {"てすと"}
    destination_name_kana {"テスト"}
    postal_code {"1111111"}
    prefectures {"1"}
    municipality {"大阪市"}
    address {"1-1-1"}
  end

end
