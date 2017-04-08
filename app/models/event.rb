class Event < ApplicationRecord
  belongs_to :project

  enum priority: [:low, :medium, :high]
end
