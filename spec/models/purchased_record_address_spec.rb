require 'rails_helper'

RSpec.describe PurchasedRecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchased_record_address = FactoryBot.build(:purchased_record_address, user_id: user.id, item_id: item.id)
  end

  describe '購入情報の保存' do
    context '購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchased_record_address).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchased_record_address.building = ''
        expect(@purchased_record_address).to be_valid
      end
    end

    context '購入情報が保存できない場合' do
      it 'postal_codeが空だと保存できない' do
        @purchased_record_address.postal_code = ''
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it 'postal_codeにハイフンが含まれていないと保存できない' do
        @purchased_record_address.postal_code = '1234567'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeが不正な桁数だと保存できない' do
        @purchased_record_address.postal_code = '1234-5678'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'postal_codeに数字以外が含まれていると保存できない' do
        @purchased_record_address.postal_code = '123-456あ'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it 'prefecture_idが1だと保存できない' do
        @purchased_record_address.prefecture_id = 1
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'municipalityが空だと保存できない' do
        @purchased_record_address.municipality = ''
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "Municipality can't be blank"
      end
      it 'house_numberが空だと保存できない' do
        @purchased_record_address.house_number = ''
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phone_numberが空だと保存できない' do
        @purchased_record_address.phone_number = ''
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @purchased_record_address.phone_number = '090123456789'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Phone number はハイフンなしで入力してください'
      end
      it 'phone_numberが9桁以下だと保存できない' do
        @purchased_record_address.phone_number = '090123456'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Phone number はハイフンなしで入力してください'
      end
      it 'phone_numberにハイフンが含まれていると保存できない' do
        @purchased_record_address.phone_number = '090-1234-5678'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Phone number はハイフンなしで入力してください'
      end
      it 'phone_numberに数字以外が含まれていると保存できない' do
        @purchased_record_address.phone_number = '0901234567あ'
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include 'Phone number はハイフンなしで入力してください'
      end
      it 'user_idが空だと保存できない' do
        @purchased_record_address.user_id = nil
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと保存できない' do
        @purchased_record_address.item_id = nil
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include "Item can't be blank"
      end
      it 'tokenが空では登録できないこと' do
        @purchased_record_address.token = nil
        @purchased_record_address.valid?
        expect(@purchased_record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
