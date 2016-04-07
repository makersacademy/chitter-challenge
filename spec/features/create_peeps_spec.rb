require_relative 'web_helper'

feature 'creating new peeps' do

  before do
    User.create(username: 'TestUser1', name: 'Bobby Test', email: 'test@testmail.com', password: 'password', password_confirmation: 'password')
    sign_in
    visit'/peeps/new'
    fill_in 'peep', with: 'This is one mighty new peep'
    click_button 'Send peep'
  end

  scenario 'user adds a peep and it is stored/displayed' do
    within 'ul#peeps' do
      expect(page).to have_content('This is one mighty new peep')
    end
  end

  scenario 'username displayed with peep' do
    within 'ul#peeps' do
      expect(page).to have_content('TestUser1')
    end
  end

  scenario 'time created displayed with peep' do
    within 'ul#peeps' do
      expect(page).to have_content(Time.new.strftime('%H:%M:%S, %d %b %Y'))
    end
  end
end
