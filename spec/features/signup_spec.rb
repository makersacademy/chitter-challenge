require 'pg'

feature 'Maker can register for an account' do
  scenario 'Maker can register with email, password, name and username' do
    sign_up
    expect(page).to have_content 'Welcome to Chitter'
  end
end
