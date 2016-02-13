# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'signing up to chitter' do
   scenario "I can sign up" do
     sign_up
     expect(page).to have_content('Welcome, Piet Jansen')
   end
end
