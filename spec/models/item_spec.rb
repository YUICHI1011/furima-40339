require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user) 
      @item = FactoryBot.build(:item, user: @user)
    end

    describe '商品出品登録' do
      context '商品出品できる場合' do
        it '必要事項を全て過不足なく入力すると登録できる' do
          expect(@item).to be_valid
        end
      end

      context '商品出品できない場合' do
        it "imageが空では登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it "商品名が空では登録できない" do
          @item.name  = ""
          @item.valid?
          expect(@item.errors.full_messages).to include ("Name can't be blank")
        end

        it "商品の説明が空では登録できない" do
          @item.description  = ""
          @item.valid?
          expect(@item.errors.full_messages).to include ("Description can't be blank")
        end

        it "カテゴリーの選択が必須であること" do
          @item.category_id  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include ("Category can't be blank")
        end

        it "カテゴリー選択が1以外の値であること" do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Category must be other than 1")
        end

        it "商品の状態の選択が必須であること" do
          @item.status_id  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include ("Status can't be blank")
        end

        it "商品の状態の選択が1以外の値であること" do
          @item.status_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Status must be other than 1")
        end

        it "配送料の負担の選択が必須であること" do
          @item.shipping_fee_id  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include ("Shipping fee can't be blank")
        end

        it "配送料の負担の選択が1以外の値であること" do
          @item.shipping_fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping fee must be other than 1")
        end

        it "発送元の地域の選択が必須であること" do
          @item.prefecture_id  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
        end

        it "発送元の地域の選択が1以外の値であること" do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it "発送までの日数の選択が必須であること" do
          @item.shipping_day_id  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include ("Shipping day can't be blank")
        end

        it "発送までの日数の選択が1以外の値であること" do
          @item.shipping_day_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
        end

        it "商品価格が空では登録できないこと" do
          @item.price  = ""
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end
        
        it "商品価格が全角数字では登録できないこと" do
          @item.price = "１０００" # 全角数字を代入
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not a number")
        end
      
        it "商品価格が299円以下では出品できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
        end

        it "商品価格が10_000_000円以上では出品できない" do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end
      
        it "userが紐づいていないと出品できない" do
          @item.user  = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("User must exist")
        end
      end
    end
  end
end