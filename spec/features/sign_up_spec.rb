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

  scenario 'Raises an error if username is already taken' do
    create_user
    visit '/chitter'
    click_on 'Sign up'
    fill_in 'name', with: 'Beyoncé'
    fill_in 'username', with: 'Yoncé'
    fill_in 'email', with: 'yonce@gmail.com'
    fill_in 'password', with: 'saymyname'
    click_button 'Create user'
    expect(page).to have_content('This username is already taken')
  end

  scenario 'Raises an error if email is already in use' do
    create_user
    visit '/chitter'
    click_on 'Sign up'
    fill_in 'name', with: 'Beyoncé'
    fill_in 'username', with: 'Bey'
    fill_in 'email', with: 'queenb@gmail.com'
    fill_in 'password', with: 'saymyname'
    click_button 'Create user'
    expect(page).to have_content('This email is already in use')
  end
end
