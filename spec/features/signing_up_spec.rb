feature 'signing up as a user' do
  let(:name) { 'Steve Mandanda' }
  let(:username) { 'Marseille_Captain' }
  let(:password) { 'lepassword' }
  let(:email_address) { 'marseille_number_1@marseille.fc' }

  context 'when creating a new user' do
    before do
      visit('/users/new')
      fill_in('name', with: name)
      fill_in('username', with: username)
      fill_in('password', with: password)
      fill_in('email_address', with: email_address)
      click_button('Create User')
    end
    scenario 'it shows a welcome message' do
      expect(page).to have_content("Welcome #{username}")
    end
  end

end
