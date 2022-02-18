require 'rails_helper'

feature 'User can create habit', "
  In order to start tracking habits
  As an authenticated user
  I'd like to be able to create habit
" do
  given(:user) { create(:user) }

  describe 'Authenticated user' do
    background do
      sign_in(user)
      
      visit habits_path
      click_on 'Create habit'
    end

    scenario 'create a habit' do
      fill_in 'Title', with: 'Name habit'
      fill_in 'Description', with: 'description of the habit'
      click_on 'Create'

     expect(page).to have_content 'Your habit successfully created.'
      expect(page).to have_content 'Name habit'
      expect(page).to have_content 'description of the habit'
    end

    scenario 'create a habit with errors' do
      click_on 'Create'

      expect(page).to have_content "Title can't be blank"
    end
  end

  scenario 'Unauthenticated user tries create a habit' do
    visit habits_path
    click_on 'Create habit'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
