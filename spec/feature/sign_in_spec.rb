require 'spec_helper'

feature 'User sign in' do

  let!(:user) do
    User.create(email: 'test@test.com',
                name: 'Testy McTest',
                user_name: 'Test1',
                password: '123456',
                password_confirmation: '123456')
  end

  scenario 'sign in with correct details' do
  sign_in(email: user.email, password: user.password)
  expect(page).to have_content "Welcome, #{user.user_name}"
      end

  scenario 'i want to post on a peep on chitter' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Got something to say?"
  end

end
