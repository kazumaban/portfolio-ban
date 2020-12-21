class Management < ApplicationRecord

belongs_to :user
belongs_to :record

def chart_date
  order.where(amount:100).pluck('created_at', 'unit_price')
end

end
