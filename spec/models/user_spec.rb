require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
    it '正しい値を入力すれば登録できる' do
      expect(@user).to be_valid
    end
    end

    context '新規登録出来ない時' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Nicknameを入力してください"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Emailを入力してください"

    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include"Passwordを入力してください"
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmationとPasswordの入力が一致しません", "Password confirmationを入力してください"
    end
    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @password_confirmation = 'aaaa'
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First nameを入力してください", "First nameは不正な値です"
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last nameを入力してください", "Last nameは不正な値です"
    end
    it 'first_nameが数字だと登録できない' do
      @user.first_name = '1111'
      @user.valid?
      expect(@user.errors.full_messages).to include"First nameは不正な値です"
    end
    it 'last_nameが数字だと登録できない' do
      @user.last_name = '12334'
      @user.valid?
      expect(@user.errors.full_messages).to include"Last nameは不正な値です"
    end
    it 'Emailに@がないと登録できない' do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include"Emailは不正な値です"
    end
    it 'Emailは一意性である' do
      @user.save
      another_user =FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include"Emailはすでに存在します"
    end
    end
  end
end
