feature 'creating new user' do
  scenario 'displays sign up page' do
    visit '/chitter'
    click_on 'Sign up'
    expect(page).to have_content('Email')
  end

  scenario 'Adds a new user' do
    visit '/chitter'
    click_on 'Sign up'
    fill_in 'name', with: 'Beyonce Knowles'
    fill_in 'username', with: 'Yoncé'
    fill_in 'email', with: 'queenb@gmail.com'
    fill_in 'password', with: 'lemonade'
    click_button 'Create user'
    expect(page).to have_content('User Yoncé has been created')
  end
end
