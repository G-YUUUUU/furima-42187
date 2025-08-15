class PurchasedRecordAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :municipality
    validates :house_number
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'はハイフンなしで入力してください' }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchased_record = PurchasedRecord.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number,
                           building: building, phone_number: phone_number, purchased_record_id: purchased_record.id)
  end
end
