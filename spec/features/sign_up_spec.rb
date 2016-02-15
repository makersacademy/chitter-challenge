feature 'signing up to chitter' do

  scenario 'a user can sign up with an email, name, username and password' do
    sign_up
    expect(page).to have_content('Hello Emma, welcome to Chitter!')
  end

  scenario 'a user enters an email address already taken' do
    sign_up
    sign_up
    expect(page).to have_content('Email address already in use')
  end

  scenario 'a user enters a username already taken' do
    sign_up
    sign_up
    expect(page).to have_content('Username already taken')
  end

  scenario 'a user enters an invalid email address format' do
    sign_up('Emma', 'esbaddeley', 'bademail', 'password', 'password')
    expect(page).to have_content('Not a valid email address')
  end

  scenario 'a user leaves out name, emailaddress or username' do
    sign_up('', '', '', 'password', 'password')
    expect(page).to have_content('You need to enter a name')
    expect(page).to have_content('You need to enter a username')
    expect(page).to have_content('You need to enter an email address')
  end

  scenario 'password and confirmation password do not match' do
    sign_up('Emma', 'esbaddeley', 'email@email.com', 'password', 'notapassword')
    expect(page).to have_content('Passwords do not match, please try again')
  end

end
