class Note < ApplicationRecord
  belongs_to :project

  # belongs_to :creator, class_name: 'User', foreign_key: 'created_by'
  belongs_to :user
end
