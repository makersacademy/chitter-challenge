feature 'registration' do
  # As a social media user
  # So that I can post messages on Chitter as me
  # I want to sign up/register for Chitter
  scenario 'A user can sign up' do
    visit '/users/new'
    fill_in('email', :with => 'test@example.com')
    fill_in('password', :with => 'password123')
    click_button('Submit')
    expect(page).to have_content("Welcome, test@example.com")
  end
end
