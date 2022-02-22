require 'rails_helper'

feature 'User can delete habit' do
  describe 'authenticated user' do
    describe 'is author of habit' do
      given(:user) { create(:user, :with_habit) }

      background do
        sign_in(user)
        visit habit_path(user.habits.first)
      end

      scenario 'should delete' do
        expect(page).to have_content(user.habits.first.description)
        click_on('Delete habit')
        expect(page).to have_content('Your habit successfully deleted.')
      end
    end

    describe 'is not author of habit' do
      given(:user) { create(:user) }
      given(:habit) { create(:habit) }

      background do
        sign_in(user)
        visit habit_path(habit)
      end

      scenario 'should not delete' do
        expect(page).not_to have_content('Delete uestion')
      end
    end
  end

  describe 'unauthenticated user' do
    given(:user) { create(:user) }
    given(:habit) { create(:habit) }

    scenario 'can`t delete habit' do
      visit habit_path(habit)
      expect(page).not_to have_content('Delete habit')
    end
  end
end
