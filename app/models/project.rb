class Project < ApplicationRecord
  has_many :project_users
  has_many :users, through: :project_users

  has_many :change_order_requests
  has_many :comments
  has_many :date_change_requests
  has_many :documents
  has_many :drawings
  has_many :events
  has_many :folders
  has_many :notes
  has_many :notifications
  has_many :photos
  has_many :trades
end
