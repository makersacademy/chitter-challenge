feature 'user sign up' do
  scenario 'checks a new user can sign up' do
    visit '/'
    click_link('here')
    expect(page).to have_content("Sign up for Chitter!")
    fill_in('name', with: 'Tom')
    fill_in('email', with: 'tom@gmail.com')
    fill_in('username', with: 'TomChitter')
    fill_in('password', with: 'tom2000')
    click_button("Register")
    expect(page).to have_content("Thanks for signing up Tom!")
  end
end