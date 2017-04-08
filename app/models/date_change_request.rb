class DateChangeRequest < ApplicationRecord
  belongs_to :project

  def trades_affected
  	Trade.where(id: self.trades_affected.split(", "))
  end
end
