require 'spec_helper'

feature 'user sign out' do

  let!(:user) do
    User.create(email: 'database_guru@gmail.com',
                name: 'Lord Vader',
                user_name: 'darth',
                password: 'awesome123',
                password_confirmation: 'awesome123')
  end


  scenario 'as a logged in user I can sign out' do
    sign_in
    click_button 'sign out'
    expect(page).to have_content "Auf Wiedersehen, goodbye #{user.user_name}"
    expect(current_path).to eq '/'
  end


end
