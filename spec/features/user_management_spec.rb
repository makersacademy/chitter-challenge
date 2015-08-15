require 'spec_helper'


feature 'user sign up' do

  let(:user) { build(:user) }

  scenario 'Sign up page exists' do
    visit '/users/new'
    expect(page).to have_content('Please sign up')
  end


  scenario 'I can sign up as a new user' do
    sign_up_as(user)
    expect(page).to have_content('logged in as: test_user_name')
    expect(User.first.email).to eq('test@example.com')
  end

  scenario 'I cannot sign up with an exisiting username' do
    sign_up_as(user)
    sign_up_as(user)
    expect(page).to have_content('User name is already taken')
  end

  scenario 'I cannot sign up with an exisiting email' do
    sign_up_as(user)
    sign_up_as(user)
    expect(page).to have_content('Email is already taken')
  end
end

