feature 'registration' do
  scenario 'a user can sign up' do
    visit '/new_user'
    fill_in('email', with: 'ollie@ollie.com')
    fill_in('password', with: 'password')
    click_button('Submit')

    expect(page).to have_content "Welcome, ollie@ollie.com"
  end
end