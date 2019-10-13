feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    fill_in :username, with: 'Test'
    click_button('Submit')

    expect(page).to have_content "Welcome Test\nadd peeps below!"
  end

  scenario 'error message is displayed if username has been taken' do
    user_sign_up
    visit '/users/new'
    fill_in :email, with: 'test2@example.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    fill_in :username, with: 'Test'
    click_button('Submit')

    expect(page).to have_content 'We already have that username.'
  end

  scenario 'if username is not provided an error message is displayed' do
    visit '/users/new'
    fill_in :email, with: 'test2@example.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button('Submit')

    expect(page).to have_content 'A Username is required'
  end

  scenario 'if an invalid email is provided an error message is displayed' do
    visit '/users/new'
    fill_in :email, with: 'test2'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    click_button('Submit')
    expect(page).to have_content "That doesn't look like an email address to me.."
  end

  scenario 'If user does not provide an email, error message is displayed' do
    visit '/users/new'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    fill_in :username, with: 'Test'
    click_button('Submit')
    expect(page).to have_content 'A valid email address is required'
  end

  scenario 'error message is displayed if database already has the email address stored' do
    user_sign_up
    visit '/users/new'
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    fill_in :password_confirmation, with: 'password123'
    fill_in :username, with: 'Test2'
    click_button('Submit')

    expect(page).to have_content 'We already have that email.'
  end
end
