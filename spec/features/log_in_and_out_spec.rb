feature 'logging in and out' do
  scenario 'a user can log in' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')

    visit('/log_in')
    fill_in(:username, with: 'Sarahness')
    fill_in(:password, with: 'pwpwpwpw')
    click_button('Log in')

    expect(page).to have_content 'Welcome back to Chitter Sarahness!'
  end
  scenario 'a user can log out' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
  
    visit('/log_in')
    fill_in(:username, with: 'Sarahness')
    fill_in(:password, with: 'pwpwpwpw')
    click_button('Log in')
    click_button('Log out')

    expect(page).not_to have_content 'Welcome back to Chitter Sarahness!'
    expect(page).to have_content "Welcome to Chitter!"
  end
  scenario 'a user sees an error if they get their username wrong' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
  
    visit('/log_in')
    fill_in(:username, with: 'SomethingSarah')
    fill_in(:password, with: 'pwpwpwpw')
    click_button('Log in')
  
    expect(page).not_to have_content 'Welcome back to Chitter Sarahness!'
    expect(page).to have_content "Whoops, your details don't match any that we have saved!"  
    expect(page).to have_button('Try again?')
  end 
  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
  
    visit('/log_in')
    fill_in(:username, with: 'Sarahness')
    fill_in(:password, with: 'wpwpwpwp')
    click_button('Log in')
  
    expect(page).not_to have_content 'Welcome back to Chitter Sarahness!'
    expect(page).to have_content "Whoops, your details don't match any that we have saved!"  
    expect(page).to have_button('Try again?')
  end 
  scenario 'a user can use a button to redirect to the log in page if they make a mistake on their login details' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
  
    visit('/log_in')
    fill_in(:username, with: 'SillyOldSarah')
    fill_in(:password, with: 'PasswordsAreTrickyToRemember')
    click_button('Log in')
    click_button('Try again?')
  
    expect(page).to have_content "Enter your username and password below:"
  end 
end
