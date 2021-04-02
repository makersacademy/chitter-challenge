require_relative "../test_helpers"

feature 'registration' do
  scenario 'a user can register' do
    register_test_user
    expect(page).to have_content "Welcome, test@example.com"
  end
end