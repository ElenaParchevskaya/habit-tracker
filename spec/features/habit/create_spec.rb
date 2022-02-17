require 'rails_helper'

feature 'User can create habit', "
  In order to start tracking habits
  As an authenticated user
  I'd like to be able to create habit
" do
  given(:user) { User.create!(email: 'user@test.com', password: '12345678') }

  scenario 'Authenticated user create a habit' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    visit habits_path
    click_on 'Create habit'

    fill_in 'Title', with: 'Name habit'
    fill_in 'Description', with: 'description of the habit'
    click_on 'Create'

    expect(page).to have_content 'Your habit successfully created.'
    expect(page).to have_content 'Name habit'
    expect(page).to have_content 'description of the habit'
  end

  scenario 'Authenticated user create a habit with errors'
  scenario 'Unauthenticated user tries create a habit'
end
