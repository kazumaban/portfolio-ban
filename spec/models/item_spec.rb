require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    it "itemの内容がルール通りに記載されていれば、登録できること" do
      expect(@item).to be_valid
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameが空だと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "explanationが空だと登録できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "priceが空だと登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceは300円以下では登録できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "priceは9999999円以上では登録できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it "priceは半角英字では登録できない" do
      @item.price = "a"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it "priceは全角英字では登録できない" do
      @item.price = "S"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it "priceは全角数字では登録できない" do
      @item.price = "１１１１"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end
    it "categoryは--では登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
    it "statusは--では登録できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status Select")
    end
    it "delivery_feeは--では登録できない" do
      @item.delivery_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee Select")
    end
    it "delivery_areaは--では登録できない" do
      @item.delivery_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area Select")
    end
    it "delivery_dayは--では登録できない" do
      @item.delivery_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery day Select")
    end
  end
end