feature 'User can sign up' do
  scenario 'user can visit a form that requires input for signing up' do
    visit '/'
    click_on 'Sign Up'
    expect(page).to have_field 'Name' 
    expect(page).to have_field 'User name'
    expect(page).to have_field 'email address'
    expect(page).to have_field 'Password'
    expect(page).to have_field 'Confirm password'
    expect(page).to have_field 'Sign up'

  end 

  scenario 'user can see confirmation message if their signup is successful' do 

  end

  scenario 'user can see error message is their email format is incorrect' do 
  end

  scenario 'user can see error message if their email already exists in the database' do
  end
end

feature 'User can log in' do
  scenario 'user can see a form for username and password to log in' do
  end

  scenario 'user can see an error message when incorrect credentials are provided' do
  end

  scenario 'user is taken to the Chitter feed when log in is successful' do
  end
end

feature 'User can log out' do
  scenario 'user is able to see a log out button on the website' do 
  end

  scenario 'user is taken to the log in page when they press log out' do 
  end

  scenario 'user cannot go back from the log in page' do
  end
end


