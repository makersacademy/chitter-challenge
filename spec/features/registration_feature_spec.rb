feature 'Registration' do

  # User Story 4
  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'a user can sign up to Chitter' do
    sign_up
    expect(page).to have_content 'You are signed in as testusername'
  end
end
