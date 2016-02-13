feature 'signing up to chitter' do
   scenario "I can sign up" do
     sign_up
     expect(page).to have_content('Welcome, Piet Jansen')
   end
end
