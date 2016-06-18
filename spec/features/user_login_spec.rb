#As a Maker
#So that I can post messages on Chitter as me
#I want to log in to Chitter

feature 'Signin' do

  scenario 'A user can sign up, go to /, signin, and username is shown' do
    signup
    signin
    expect(page).to have_content(@random_username)
  end
  
end
