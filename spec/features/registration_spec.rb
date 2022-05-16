feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in 'email', with: 'test@example.com'
    fill_in 'password', with: 'password123'
    fill_in 'name', with: 'Example Name'
    fill_in 'username', with: '@example_user'
    click_button 'Submit'

    expect(page).to have_content "Welcome, Example Name"
  end
end
