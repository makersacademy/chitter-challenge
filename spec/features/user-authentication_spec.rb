require_relative '../spec_helper'

feature 'sign in' do

  let(:user) {  User.create(name: 'test', email: 'test@test.com', password: 'password123') }

  scenario 'a user is able to sign in' do
    sign_in
    expect(page).to have_content "Welcome to your dashboard, Test"
  end

  scenario 'sign in failure' do
    bad_email_sign_in
    expect(page).to have_content 'Invalid information'
  end

end
