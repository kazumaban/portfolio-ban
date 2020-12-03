class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :delivery_fee
    belongs_to :delivery_area
    belongs_to :delivery_day

  belongs_to :user
  has_one :record
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price, numericality: {with: /\A[0-9]+\z/, message: 'Half-width number'}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  end

  with_options numericality: { other_than: 1 , message: 'Select'} do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :delivery_area_id 
    validates :delivery_day_id
  end
end
