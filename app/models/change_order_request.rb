class ChangeOrderRequest < ApplicationRecord
  belongs_to :project
  belongs_to :trade
end
