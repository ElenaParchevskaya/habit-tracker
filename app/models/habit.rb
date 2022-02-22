class Habit < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  
  validates :title, :description, presence: true
end
