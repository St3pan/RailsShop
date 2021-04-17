class OrdersDescription < ApplicationRecord
    belongs_to :order 
    has_one :item
end
