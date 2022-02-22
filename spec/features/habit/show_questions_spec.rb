require 'rails_helper'

feature 'Someone can get list of habits' do
  background { create_list(:habit, 4) }

  scenario 'get list of habits' do
    visit habits_path
    expect(page).to have_content 'Habits'
    expect(page.all('li', text: 'MyTitle').size).to eq Habit.count
  end
end
