feature 'adding a new user' do
  scenario 'a user can sign up, adding themselves to user list' do
    visit('/')
    fill_in('name', with: 'A Guy')
    fill_in('email', with: 'aguy@gmail.com')
    fill_in('password', with: 'password123')
    fill_in('user_name', with: '1234')
    click_button('Submit')

    expect(page).to have_content('aguy@gmail.com')


  end
end
