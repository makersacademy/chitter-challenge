RSpec.feature 'Sign Up' do
  scenario 'user wants to be able to fill in details and sign up' do
    sign_up
    expect(page).to have_content('Welcome, User')
  end
end
