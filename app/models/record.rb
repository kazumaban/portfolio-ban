class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  has_one    :address
  has_one    :management

  with_options presence: true do
    validates :user
    validates :item
  end

end


