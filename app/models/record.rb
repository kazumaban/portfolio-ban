class Record < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  belongs_to :management
  has_one :address

  with_options presence: true do
    validates :user
    validates :item
  end

end


