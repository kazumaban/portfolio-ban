require 'rails_helper'
RSpec.describe Shopping, type: :model do
  before do
    @shopping = FactoryBot.build(:shopping)
  end

  describe '購入記録' do
    it "shoppingの内容がルール通りに記載されていれば、登録できること" do
      expect(@shopping).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @shopping.token = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Token can't be blank")
    end
    it "postal_codeが空では登録できないこと" do
      @shopping.postal_code = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Postal code can't be blank")
    end
    it "postal_codeが全角数字では登録できないこと" do
      @shopping.postal_code = "５８１ー００９２"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Postal code input correctly")
    end
    it "postal_codeが正しい書式以外では登録できないこと" do
      @shopping.postal_code = "aaa-AAAA"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Postal code input correctly")
    end

    it "prefectureが--では登録できないこと" do
      @shopping.prefecture_id = 1
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Prefecture Select")
    end
    it "cityが空では登録できないこと" do
      @shopping.city = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("City can't be blank")
    end
    it "house_numberが空では登録できないこと" do
      @shopping.house_number = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが空では登録できないこと" do
      @shopping.phone_number = ""
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが全角数字では登録できないこと" do
      @shopping.phone_number = "０８０４７０１１９２０"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Phone number Input only number")
    end
    it "phone_numberが半角数字以外の文字では登録できないこと" do
      @shopping.phone_number = "あaA"
      @shopping.valid?
      expect(@shopping.errors.full_messages).to include("Phone number Input only number")
    end

  end
end