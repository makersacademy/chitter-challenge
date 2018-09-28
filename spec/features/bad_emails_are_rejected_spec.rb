feature 'the user can sign up to chitter' do
  scenario 'from the home page' do
    visit '/users/new'
    fill_in 'name', with: 'Borace'
    fill_in 'username', with: 'Borace01'
    fill_in 'email', with: 'Borace01'
    fill_in 'password', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content 'You entered incorrect information, please try again'
  end
end
