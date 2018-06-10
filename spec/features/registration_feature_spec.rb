feature 'Registration' do

  # User Story 4
  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'a user can sign up to Chitter' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test name')
    fill_in('username', with: 'testusername')
    click_button ('Submit')
    expect(page).to have_content 'You are signed in as testusername'
  end
end
