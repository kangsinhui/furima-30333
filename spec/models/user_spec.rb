require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name can't be blank")
    end
    it "family_nameは全角じゃないと登録できない" do
      @user.family_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name 全角文字を使用してください")
    end
    it "first_nameは全角じゃないと登録できない" do
      @user.first_name = 'aa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name 全角文字を使用してください")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana can't be blank")
    end
    it "family_name_kanaはカタカナじゃないと登録できない" do
      @user.family_name_kana = 'bb'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Family name kana 全角カタカナのみで入力して下さい")
    end
    it "first_name_kanaはカタカナじゃないと登録できない" do
      @user.first_name_kana = 'bb'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana 全角カタカナのみで入力して下さい")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Birthday can't be blank")
    end
  end
end
