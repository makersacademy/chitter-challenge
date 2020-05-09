feature 'Signing up a new user' do
  scenario 'creates a user account' do
    visit('/users/new')

    fill_in('name', with: 'Gaz2020')
    fill_in('email', with: 'gareth@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(current_path).to eq '/users/login'

    fill_in('email', with: 'gareth@gmail.com')
    fill_in('password', with: 'password123')
    click_button('Login')

    expect(page).to have_content 'Gaz2020'
  end
end
