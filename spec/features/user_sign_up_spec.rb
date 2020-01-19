feature 'User signs up for Chitter account' do
  scenario 'User signs up using form' do
    visit '/'
    click_button 'Sign Up'
    fill_in 'name', :with => 'name1'
    fill_in 'username', :with => 'username1'
    fill_in 'email', :with => 'name1@email.com'
    fill_in 'password', :with => 'password'
    click_button 'Sign Up'
    expect(page).to have_content 'name1'
  end

  scenario 'Does not allow user to sign up with existing username' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')
    visit '/'
    click_button 'Sign Up'
    fill_in 'name', :with => 'newuser'
    fill_in 'username', :with => 'testusername'
    fill_in 'email', :with => 'newuser@email.com'
    fill_in 'password', :with => 'password'
    click_button 'Sign Up'

    expect(page).not_to have_content 'Welcome to Chitter testusername'
    expect(page).to have_content 'Username or Email already exists'
  end

  scenario 'Does not allow user to sign up with existing username' do
    User.create(name: 'testname', username: 'testusername', email: 'test@email.com', password: 'testpassword')
    visit '/'
    click_button 'Sign Up'
    fill_in 'name', :with => 'newuser'
    fill_in 'username', :with => 'newusername'
    fill_in 'email', :with => 'test@email.com'
    fill_in 'password', :with => 'password'
    click_button 'Sign Up'

    expect(page).not_to have_content 'Welcome to Chitter testusername'
    expect(page).to have_content 'Username or Email already exists'
  end
end
