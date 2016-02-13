require_relative 'web_helpers'

feature 'Signing in to Chitter' do
  include UserHelpers

  before do
    User.create(
      username: 'amanzano',
      password: 'pass',
      password_confirmation: 'pass',
      email: 'arnold@myemail.com',
      name: 'Arnold Manzano')
  end

  scenario 'Signing in successfully' do
    sign_in
    expect(page).to have_content('Welcome amanzano')
  end

  # scenario 'Invalid username or user does not exist' do
  # end
  #
  # scenario 'Invalid password or wrong password' do
  # end

end
