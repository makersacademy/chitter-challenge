require 'spec_helper'

feature 'user logout' do
  let(:user) {User.create(name: "Sara",
     handle: "sarsar", email: "sar@sara.com",
    password: "cheese", password_confirmation: "cheese")
  }

  scenario 'logged in user logs out' do
    user
    visit '/'
    log_in("sar@sara.com", "cheese")
    click_button 'Log out'
    expect(page).to have_content 'Goodbye!'
  end

end
