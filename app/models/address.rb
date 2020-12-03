class Address < ApplicationRecord
  belongs_to :record

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city  
    validates :house_number   
    #validates :building_name
    validates :phone_number  
    validates :record 
  end

end

