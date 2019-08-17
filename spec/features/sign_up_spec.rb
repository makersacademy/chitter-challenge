require_relative '../web_helpers'

feature 'signup' do
  scenario 'a user can sign up' do
    signup
    
    expect(page).to have_content "Welcome, testusername"
  end
end
