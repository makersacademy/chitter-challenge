require 'pry'

feature 'sign up' do
  scenario 'user can sign up with their email address, name, username, and a password' do
    sign_up_user
    # binding.pry
    expect(page).to have_content "chloeverity123's peeps"
  end
end
