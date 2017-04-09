class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  belongs_to :trade, optional: true

  enum role: [:admin, :sub_trade, :client]
end
