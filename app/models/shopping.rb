class Shopping
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "input correctly" }
    validates :prefecture_id, numericality: { other_than: 1 , message: 'Select'}
    validates :city
    validates :house_number
    #validates :building_name
    validates :phone_number, numericality: {with: /\A[0-9]+\z/, message: 'Input only number'}
  end

    def save
      record = Record.create(user_id: user_id, item_id: item_id)
      Address.create(record_id: record.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number)
    end
end