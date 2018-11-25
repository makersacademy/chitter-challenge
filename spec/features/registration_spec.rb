feature 'registration' do

  scenario 'a new user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Darryl Banks')
    fill_in('email', with: 'test@example.com')
    fill_in('user_name', with: 'dazza')
    fill_in('password', with: 'password123')
    click_button('submit')

    expect(page).to have_content "Welcome, Darryl Banks"
  end
end
