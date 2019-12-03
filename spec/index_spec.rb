# frozen_string_literal: true

feature 'Visit homepage' do
  scenario 'User can visit homepage to view Chitter' do
    visit('/')
    expect(page).to have_content 'Welcome to the Chitter homepage'
  end
end
