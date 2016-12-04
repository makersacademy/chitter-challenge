require 'web_helper'

feature 'a user can sign up to chitter' do

  scenario 'a user can complete a sign up form' do
    sign_up
    expect(current_path).to eq('/sign-up')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Please sign up to peep to the world!')
    expect(page).to have_field('name')
    expect(page).to have_field('user_name')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_button('Sign me up!')
  end

  scenario 'a user can complete signing up' do
    expect { user_signs_up }.to change(User, :count).by(1)
    expect(current_path).to eq('/my-chitter')
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Welcome to chitter Kate McCaffrey!')
    expect(User.first.email).to eq('mac@shaper.com')
  end

end
