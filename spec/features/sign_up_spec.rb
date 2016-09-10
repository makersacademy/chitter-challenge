require 'spec_helper'

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    sign_up_correct_password
    expect(page).to have_content('Welcome, matt@matt.com')
    expect(User.first.email).to eq('matt@matt.com')
    expect(User.count).to eq(1)
  end

  scenario 'password confirmation' do
    sign_up_wrong_password
    expect(User.count).to eq(0)
  end

  scenario 'with a password that does not match' do
    sign_up_wrong_password
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
end

end
