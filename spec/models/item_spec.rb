require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品登録" do
    context '出品登録できる時' do
      it "image、name、description、category_id、condition_id、cost_id、prefectures_id、day_id、priceがあれば登録できる" do
        expect(@item).to be_valid
      end
      it "priceは￥300~9999999の半角数字であれば登録できる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "category_idの選択が1以外であれば登録できる" do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it "condition_idの選択が1以外であれば登録できる" do
        @item.condition_id = 2
        expect(@item).to be_valid
      end
      it "cost_idの選択が1以外であれば登録できる" do
        @item.cost_id = 2
        expect(@item).to be_valid
      end
      it "prefectures_idの選択が1以外であれば登録できる" do
        @item.prefectures_id = 2
        expect(@item).to be_valid
      end
      it "day_idの選択が1以外であれば登録できる" do
        @item.day_id = 2
        expect(@item).to be_valid
      end
    end

    context '出品登録できない時' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Description can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end
      it "category_idの選択が1だと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category must be other than 1")
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end
      it "condition_idの選択が1だと登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition must be other than 1")
      end
      it "cost_idが空だと登録できない" do
        @item.cost_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Cost can't be blank")
      end
      it "cost_idの選択が1だと登録できない" do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Cost must be other than 1")
      end
      it "prefectures_idが空だと登録できない" do
        @item.prefectures_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefectures can't be blank")
      end
      it "prefectures_idの選択が1だと登録できない" do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefectures must be other than 1")
      end
      it "day_idが空だと登録できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day can't be blank")
      end
      it "day_idの選択が1だと登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include ("Day must be other than 1")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
      it "priceが全角文字だと登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price には300~9999999の半角数字を使用してください")
      end
      it "priceが半角英数混合だと登録できない" do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price には300~9999999の半角数字を使用してください")
      end
      it "priceが半角英語だけだと登録できない" do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price には300~9999999の半角数字を使用してください")
      end
      it "priceが¥299以下だと登録できない" do
        @item.price = 30
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price には300~9999999の半角数字を使用してください")
      end
      it "priceが¥10000000以上だと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price には300~9999999の半角数字を使用してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end

end
