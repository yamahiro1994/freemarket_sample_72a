FactoryBot.define do
  factory :item do
    title               {"商品編集エラーテストタイトル"}
    content             {"商品編集エラーテストコメント"}
    price               {30000}
    status_id           {1}
    delivery_method_id  {1}
    prefecture_id       {1}
    delivery_days_id    {1}
    delivery_charge_id  {1}
    category_id         {1}

    after(:build) do |item|
      item.images << build(:image, item: item)
    end
  end
end