feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'me@myemail.com')
    fill_in('password', with: '123456789')
    click_button('Submit')

    expect(page).to have_content "Welcome, me@myemail.com"
  end
end
