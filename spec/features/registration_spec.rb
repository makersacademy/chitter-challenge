feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Francesco')
    fill_in('username', with: 'France8')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(page).to have_content "Welcome, Francesco"
  end
end