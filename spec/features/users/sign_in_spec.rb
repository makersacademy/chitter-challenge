require_relative '../helpers/session'
include SessionHelpers



feature 'users signs in' do

  before(:each) do
    User.create(email: 'test@test.com',
                password: 'test',
                password_confirmation: 'test',
                username: 'john78')
  end

  scenario 'with correct credential' do
  visit('/')
  expect(page).not_to have_content('Welcome, john78')
  sign_in('test@test.com', 'test')
  expect(page).to have_content('Welcome, john78')
  end
end