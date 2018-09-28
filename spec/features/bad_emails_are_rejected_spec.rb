feature 'the user can sign up to chitter' do
  scenario 'from the home page' do
    setup_test_database
    visit '/users/new'
    fill_in 'name', with: 'Billy'
    fill_in 'username', with: 'Billy01'
    fill_in 'email', with: 'billy'
    fill_in 'password', with: 'b1lly01!'
    click_button 'Sign up'
    expect(page).to have_content 'You entered incorrect information, please try again'
  end
end
