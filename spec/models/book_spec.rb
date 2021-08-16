require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @book = FactoryBot.build(:book)
  end

  describe '本の投稿' do
    
    context '本が投稿できる' do
      it '正しい値を入手すると投稿できる' do
        expect(@book).to be_valid
      end
    end

    context '本が投稿できない' do
      it 'nameが空だと登録出来ない' do
        @book.name = ''
        @book.valid?
        expect(@book.errors.full_messages).to include"Nameを入力してください"
      end
      it 'infoが空だと登録出来ない' do
        @book.info = ''
        @book.valid?
        expect(@book.errors.full_messages).to include"Infoを入力してください"
      end
      it 'priceが空だと入力してください' do
        @book.price = ''
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceを入力してください"
      end
      it 'author_nameが空だと投稿できない' do
        @book.author_name = ''
        @book.valid?
        expect(@book.errors.full_messages).to include"Author nameを入力してください"
      end
      it 'published_onが空だと登録出来ない' do
        @book.published_on = ''
        @book.valid?
        expect(@book.errors.full_messages).to include"Published onを入力してください"
      end
      it 'categoryが空だと登録することが出来ない' do
        @book.category_id = '1'
        @book.valid?
        expect(@book.errors.full_messages).to include"Categorycan't be blank"
      end
      it 'appearanceが空だと登録出来ない' do
        @book.appearance_id = '1'
        @book.valid?
        expect(@book.errors.full_messages).to include"Appearancecan't be blank"
      end
      it 'priceが数字以外では登録出来ない' do
        @book.price = 'aaaa'
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceは一覧にありません"
      end
      it 'priceが0より小さい時登録出来ない' do
        @book.price = '-1'
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceは一覧にありません"
      end
      it 'priceが10.000.000より大きいとき登録出来ない' do
        @book.price = '10000000'
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceは一覧にありません"
      end
      it '商品画像がついていない' do
        @book.image = nil
        @book.valid?
        expect(@book.errors.full_messages).to include"Imageを入力してください"
      end
      it 'Priceが全角文字では登録出来ない' do
        @book.price = 'あいうえお'
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceは一覧にありません"
      end
      it 'Priceは半角英語では登録出来ない' do
        @book.price = 'aiueo'
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceは一覧にありません"
      end
      it 'Priceは半角英数混合では登録出来ない' do
        @book.price = 'a1i2u'
        @book.valid?
        expect(@book.errors.full_messages).to include"Priceは一覧にありません"
      end
      it 'userが紐づいていない時は登録出来ない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include"Userを入力してください"
      end
      it '' do
        
      end


    end

  end
end
