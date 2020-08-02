require 'web_helpers'

feature 'registration' do
  scenario 'a user can sign up' do
    register_user

    expect(page).to have_content "Welcome, FirstAuthor"
  end
end
