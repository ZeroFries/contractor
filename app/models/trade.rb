class Trade < ApplicationRecord
  belongs_to :project
  belongs_to :trade

  has_many :change_order_requests
end
