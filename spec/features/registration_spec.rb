feature 'registration' do
  scenario 'a user can sign up' do
    visit '/registrations/signup'
    fill_in('name', with: 'Erin')
    fill_in('username', with: 'ES94')
    fill_in('email', with: 'estevenson@hotmail.com')
    fill_in('password', with: 'password123')
    click_button('submit')

    expect(page).to have_content "Welcome to Chitter Erin"
  end
end
