class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :project_users
  has_many :projects, through: :project_users
  has_many :trades, through: :project_users

  has_many :change_order_requests, through: :projects
  has_many :comments, through: :projects
  has_many :date_change_requests, through: :projects
  has_many :documents, through: :projects
  has_many :drawings, through: :projects
  has_many :events, through: :projects
  has_many :folders, through: :projects
  has_many :notes, through: :projects
  has_many :notifications, through: :projects
  has_many :photos, through: :projects

  def project_user_for(project_id)
  	self.project_users.where(project_id: project_id).first
  end

  def trade_for(project_id)
  	project_user_for(project_id).trade
  end

  def role_for(project_id)
    project_user_for(project_id).role
  end
end
