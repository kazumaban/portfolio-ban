require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "firstnameが空だと登録できない" do
      @user.firstname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it "firstnameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
      @user.firstname = "aaa0Aあ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname is invalid. Input full-width characters.")
    end
    it "lastnameが空だと登録できない" do
      @user.lastname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname can't be blank")
    end
    it "lastnameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
      @user.lastname = "aaa0Aあ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
    end
    it "firstname_katakanaが空だと登録できない" do
      @user.firstname_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
    end
    it "firstname_katakanaが全角（カタカナ）以外は登録できない" do
      @user.firstname_katakana = "aaa0Aあ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname katakana is invalid. Input full-width katakana characters.")
    end
    it "lastname_katakanaが空だと登録できない" do
      @user.lastname_katakana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
    end
    it "lastname_katakanaが全角（カタカナ）以外は登録できない" do
      @user.lastname_katakana = "aaa0Aあ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Lastname katakana is invalid. Input full-width katakana characters.")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは＠を含む必要があること" do
      @user.email = "aaaaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは数字だけでは登録できない" do
      @user.password = "1111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers.")
    end
    it "passwordは英字だけでは登録できない" do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers.")
    end
    it "passwordは全角では登録できない" do
      @user.password = "SSS１１１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid. Password Include both letters and numbers.")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end