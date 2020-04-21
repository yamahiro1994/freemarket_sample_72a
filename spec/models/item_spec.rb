require 'rails_helper'
describe Item do
  describe '#create' do
  # titleについて
  it "titleがない場合は登録できないこと" do
    item = build(:item, title: nil)
    item.valid?
    expect(item.errors[:title]).to include("translation missing: ja.activerecord.errors.models.item.attributes.title.blank")
  end
  it "titeが40文字より多いの場合は登録できないこと" do
    item = build(:item, title: "テストテストテストテストテストテストテストテストテストテストテストテストテストテスト")
    item.valid?
    expect(item.errors[:title]).to include("translation missing: ja.activerecord.errors.models.item.attributes.title.too_long")
  end

  # contentについて
  it "contentがない場合は登録出来ないこと" do
    item = build(:item, content: nil)
    item.valid?
    expect(item.errors[:content]).to include("translation missing: ja.activerecord.errors.models.item.attributes.content.blank")
  end
  it "contentが1000文字より多い場合は登録出来ないこと" do
    item = build(:item, content: "テストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテストテスト")
    item.valid?
    expect(item.errors[:content]).to include("translation missing: ja.activerecord.errors.models.item.attributes.content.too_long")
  end

  #priceについて
  it "priceが300円より下の場合登録出来ないこと" do
    item = build(:item, price: 299)
    item.valid?
    expect(item.errors[:price]).to include("translation missing: ja.activerecord.errors.models.item.attributes.price.greater_than_or_equal_to")
  end
  it "prieが9999999円より上の場合登録出来ないこと" do
    item = build(:item, price: 10000000)
    item.valid?
    expect(item.errors[:price]).to include("translation missing: ja.activerecord.errors.models.item.attributes.price.less_than_or_equal_to")
  end

  #status_idについて 
  it "status_idに数値が無い場合は登録出来ないこと" do
    item = build(:item, status_id: nil)
    item.valid?
    expect(item.errors[:status_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.status_id.not_a_number")
  end

  #delibery_method_idについて
  it "delibery_method_idに数値が無いと登録出来ないこと" do
    item = build(:item, delivery_method_id: nil)
    item.valid?
    expect(item.errors[:delivery_method_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.delivery_method_id.not_a_number")
  end    

  #prefecture_idについて
  it "prefecture_idに数値が無いと登録出来ないこと" do
    item = build(:item, prefecture_id: nil)
    item.valid?
    expect(item.errors[:prefecture_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.prefecture_id.not_a_number")
  end      

  #delivery_days_idについて
  it "delivery_days_idに数値が無いと登録出来ないこと" do
    item = build(:item, delivery_days_id: nil)
    item.valid?
    expect(item.errors[:delivery_days_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.delivery_days_id.not_a_number")
  end      

  #delivery_charge_idについて
  it "delivery_charge_idに数値が無いと登録出来ないこと" do
    item = build(:item, delivery_charge_id: nil)
    item.valid?
    expect(item.errors[:delivery_charge_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.delivery_charge_id.not_a_number")
  end       

  #category_idについて
  it "category_idに数値が無いと登録出来ないこと" do
    item = build(:item, category_id: nil)
    item.valid?
    expect(item.errors[:category_id]).to include("translation missing: ja.activerecord.errors.models.item.attributes.category_id.not_a_number")
  end      
end
end