require 'spec_helper'

feature 'logging out' do

  let!(:user) do
    User.create(name: 'Santa', username: 'santaclaus',
                email: 'santa@northpole.com',
                password: 'christmas', password_confirmation: 'christmas')
  end

  scenario 'session cleared when user signs out' do
    visit '/'
    sign_in('santaclaus','christmas')
    click_button 'Sign out'
    expect(page).to have_content('Goodbye!')
    expect(page).to_not have_content('Signed in as santaclaus')
  end

end
