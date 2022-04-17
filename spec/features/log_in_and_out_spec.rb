# scenario 'log in button' do
#   visit('/')
#   click_button('Log in here...')
#   expect(page).to have_content "Enter your username and password below:"
# end

# scenario 'user can add a peep to the page' do
#   visit('/')
#   fill_in('content', with: 'My first peep!')
#   click_button('Peep it!')
#   expect(page).to have_content 'My first peep!'
# end
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

  scenario 'a user sees an error if they get their email wrong' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
  
    visit('/log_in')
    fill_in(:username, with: 'SomethingSarah')
    fill_in(:password, with: 'pwpwpwpw')
    click_button('Log in')
  
    expect(page).not_to have_content 'Welcome back to Chitter Sarahness!'
    expect(page).to have_content 'Please check your username and password.'  
  end 
end