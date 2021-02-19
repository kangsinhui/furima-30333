require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できる時' do
      it "nickname、email、password、family_name、first_name、family_name_kana、first_name_kana、birthdayがあれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上で英数字混合だと登録できる" do
        @user.password = '111aaa'
        expect(@user).to be_valid
      end
      it "family_nameが全角だと登録できる" do
        @user.family_name = '鈴木'
        expect(@user).to be_valid
      end
      it "first_nameが全角だと登録できる" do
        @user.first_name = '次郎'
        expect(@user).to be_valid
      end
      it "family_name_kanaが全角カナだと登録できる" do
        @user.family_name_kana = 'スズキ'
        expect(@user).to be_valid
      end
      it "first_name_kanaが全角カナだと登録できる" do
        @user.first_name_kana = 'ジロウ'
        expect(@user).to be_valid
      end
    end


    context '新規登録できない時' do
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
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it "emailに@を含まなければ登録できない" do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it "passwordが６文字以下だと登録できない" do
        @user.password = '11aa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英語のみでは登録できない" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが数字のみだと登録できない" do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて設定してください")
      end
      it "passwordが全角だと登録できない" do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password には英字と数字の両方を含めて設定してください")
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
      it "family_name_kanaは全角カナじゃないと登録できない" do
        @user.family_name_kana = 'bb'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Family name kana 全角カタカナのみで入力して下さい")
      end
      it "first_name_kanaは全角カナじゃないと登録できない" do
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
end
