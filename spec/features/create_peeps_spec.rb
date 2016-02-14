require_relative 'web_helper'

feature 'creating new peeps' do
  scenario 'user adds a peep and it is stored' do
    User.create(username: 'TestUser1', name: 'Bobby Test', email: 'test@testmail.com', password: 'password', password_confirmation: 'password')
    sign_in
    visit'/peeps/new'
    fill_in 'peep', with: 'This is one mighty new peep'
    click_button 'Send peep'
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('TestUser1: This is one mighty new peep')
    end
  end
end
