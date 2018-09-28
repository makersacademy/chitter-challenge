feature 'the user can sign up to chitter' do
  scenario 'from the home page' do
    setup_test_database
    visit '/users/new'
    fill_in 'name', with: 'Borace'
    fill_in 'username', with: 'Borace01'
    fill_in 'email', with: 'Borace@mail.co.uk'
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'You are now signed up to Chitter!'
  end
end
