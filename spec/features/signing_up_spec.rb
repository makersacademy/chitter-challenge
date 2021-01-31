feature 'signing up as a user' do

  context 'when creating a new user' do
    before do
      sign_up_and_visit
    end
    scenario 'it shows a welcome message' do
      expect(page).to have_content("Welcome to Chitter Steve Mandanda")
    end
    scenario 'it no longer shows the sign up button' do
      expect(page).not_to have_selector('.go_to_signup')
    end
  end

end
