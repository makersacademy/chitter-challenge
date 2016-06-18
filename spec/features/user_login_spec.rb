#As a Maker
#So that I can post messages on Chitter as me
#I want to log in to Chitter

feature 'Signin' do

  scenario 'A user can sign up, go to /, signin, and username is shown' do
    signup
    signin
    expect(page).to have_content(@random_username)
  end

  scenario 'User signs up, goes to /, error message shown for wrong username' do
    signup
    signin_wrong_username
    expect(page).to have_content('Invalid username or psw, please try again or sign up')
  end
  
  scenario 'User signs up, goes to /, error message shown for wrong password' do
    signup
    signin_wrong_password
    expect(page).to have_content('Invalid username or psw, please try again or sign up')
  end

end
