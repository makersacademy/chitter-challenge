feature 'Signing up a new user' do
  scenario 'creates a user account' do
    visit('/users/new')

    email, password = "gareth@gmail.com", 'password123'
    fill_in('name', with: 'Gaz2020')
    fill_in('email', with: email)
    fill_in('password', with: password)
    click_button('Submit')

    expect(current_path).to eq '/users/login'
    login_user(email, password)

    expect(page).to have_content 'Gaz2020'
  end
end
