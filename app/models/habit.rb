class Habit < ApplicationRecord
  validates :title, :description, presence: true
end
