feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('user_name', with: 'katy')
    click_button('Submit')

    expect(page).to have_content "Greetings, katy"


  end
end