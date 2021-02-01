feature 'signing up as a user' do

  context 'when creating a new user' do
    before do
      sign_up_and_visit
    end
    scenario 'it shows a welcome message' do
      expect(page.status_code).to eq 200
      expect(page).to have_content("Welcome to Chitter Steve Mandanda")
    end
    scenario 'it no longer shows the sign up button' do
      expect(page.status_code).to eq 200
      expect(page).not_to have_selector('.go_to_signup')
    end
  end

  context 'when you have already created a user' do
    let(:name) { 'Steve Mandanda' }
    let(:same_username) { 'Marseille_Captain' }
    let(:different_username) { 'France_GK' }
    let(:password) { 'lepassword' }
    let(:same_email_address) {  'marseille_number_1@marseille.fc' }
    let(:different_email_address) { 'france_number_2@france.fc' }

    before do
      sign_up_and_visit
    end
    scenario "you can't create another user with same email" do
      visit('/users/new')
      fill_in('name', with: name)
      fill_in('username', with: different_username)
      fill_in('password', with: password)
      fill_in('email_address', with: same_email_address)
      click_button('Create User')
      expect(page.status_code).to eq 200
      expect(page).to have_content('Email address already taken!')
    end
    scenario "you can't create another user with the same username" do
      visit('/users/new')
      fill_in('name', with: name)
      fill_in('username', with: same_username)
      fill_in('password', with: password)
      fill_in('email_address', with: different_email_address)
      click_button('Create User')
      expect(page.status_code).to eq 200
      expect(page).to have_content('Username already taken!')
    end
  end

end
