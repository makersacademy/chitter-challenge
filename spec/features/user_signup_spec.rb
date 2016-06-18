#As a Maker
#So that I can post messages on Chitter as me
#I want to sign up for Chitter

feature 'Signup' do

  scenario 'A user can sign up, their name is displayed on the landing page' do
    signup
    expect(page).to have_content(@random_username)
  end

  xscenario 'require all fields for signup, print error if any missing' do
  end

  xscenario 'unique username and password' do
  end
end
