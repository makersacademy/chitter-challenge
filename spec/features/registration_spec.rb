require_relative 'web_helpers'

feature 'registration' do

  scenario 'a new user can sign up' do
    register_new_user

    expect(page).to have_content "Welcome, Darryl Banks"
  end
end
