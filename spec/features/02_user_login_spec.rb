# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature '02. User Login' do
  feature 'a) a user can sign in' do
   scenario 'When user inserts username and password a welcome message is displayed' do
     user_signup
     user_signin
     expect(page).to have_text("Welcome, Jose Pedro Castanheira")
   end
  end

end
