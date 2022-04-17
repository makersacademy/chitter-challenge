feature 'viewing home' do
  scenario 'welcome message' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'sign up button' do
    visit('/')
    click_button('Sign up here...')
    expect(page).to have_content "Ready to join the Chitter Family?"
  end

  scenario 'user cannot add a peep to the page before signing up/logging in' do
    visit('/')
    expect(page).to have_no_button('Peep it!')
  end

  scenario 'log in button' do
    visit('/')
    click_button('Log in here...')
    expect(page).to have_content "Enter your username and password below:"
  end
  
  scenario 'user can add a peep to the page after logging in' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
    
    visit('/log_in')
    fill_in(:username, with: 'Sarahness')
    fill_in(:password, with: 'pwpwpwpw')
    click_button('Log in')
    fill_in('content', with: 'My first peep!')
    click_button('Peep it!')

    expect(page).to have_content 'My first peep!'
  end

  scenario 'user can add a peep to the page after signing up' do
    visit '/sign_up'
    fill_in('username', with: 'Josenewmano')
    fill_in('name', with: 'Joseph Newman')
    fill_in('email', with: 'definitelyarealemail@email.com')
    fill_in('password', with: 'reallygoodpassword')
    click_button('Join Chitter')
    fill_in('content', with: '(Very witty observation)!')
    click_button('Peep it!')

    expect(page).to have_content '(Very witty observation)!'
  end

  scenario 'a user can see the time their peep was posted' do
    visit '/sign_up'
    fill_in('username', with: 'Josenewmano')
    fill_in('name', with: 'Joseph Newman')
    fill_in('email', with: 'definitelyarealemail@email.com')
    fill_in('password', with: 'reallygoodpassword')
    click_button('Join Chitter')
    fill_in('content', with: 'a timely peep')
    click_button('Peep it!')

    expect(page).to have_content 'at'
    expect(page).to have_content ':'
    expect(page).to have_content 'M'
    expect(page).to have_content '/'
  end
  scenario 'user can see their name and username of the author of each peep' do
    User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
    
    visit('/log_in')
    fill_in(:username, with: 'Sarahness')
    fill_in(:password, with: 'pwpwpwpw')
    click_button('Log in')
    fill_in('content', with: 'I (Sarah) peeped this!')
    click_button('Peep it!')

    expect(page).to have_content 'Sarah Smith'
    expect(page).to have_content 'Sarahness'
  end

  ## Test using gem explained here - https://github.com/jmondo/orderly
  ## Not working, although there is coverage in peep_spec, and gem is being installed
  # scenario 'new peeps appear at the top' do
  #   User.create(username: 'Sarahness', name: 'Sarah Smith', email: 'email@email.com', password: 'pwpwpwpw')
  #   visit('/log_in')
  #   fill_in(:username, with: 'Sarahness')
  #   fill_in(:password, with: 'pwpwpwpw')
  #   click_button('Log in')
  #   fill_in('content', with: 'a new peep')
  #   click_button('Peep it!')
  #   fill_in('content', with: 'a newer peep!')
  #   click_button('Peep it!')
  #   expect('a newer peep!').to appear_before("a new peep", only_text: true)
  # end
end
