class AddUserIdToHabits < ActiveRecord::Migration[7.0]
  def change
    add_reference :habits, :user, foreign_key: true
  end
end
