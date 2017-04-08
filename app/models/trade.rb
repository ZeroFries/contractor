class Trade < ApplicationRecord
  belongs_to :project

  has_many :change_order_requests
end
