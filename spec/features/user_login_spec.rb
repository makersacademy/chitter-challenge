#As a Maker
#So that I can post messages on Chitter as me
#I want to log in to Chitter

feature 'Signin' do

  context 'After sign up' do
    before(:each) { signup }  

    scenario 'User signs in, username is shown' do
      signin
      expect(page).to have_content(@random_username)
    end

    scenario 'User signs in with wrong username error message shown' do
      signin_wrong_username
      expect(page).to have_content('Invalid username or psw, please try again or sign up')
    end
    
    scenario 'User signs in with wrong password error message shown' do
      signin_wrong_password
      expect(page).to have_content('Invalid username or psw, please try again or sign up')
    end
  end
end
