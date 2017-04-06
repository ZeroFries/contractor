class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :users

  belongs_to :trade, optional: true
end