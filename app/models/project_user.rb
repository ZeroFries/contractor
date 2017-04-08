class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user

  belongs_to :trade, optional: true
end
