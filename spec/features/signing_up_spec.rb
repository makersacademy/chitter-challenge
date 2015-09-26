feature "User sign up" do

  def sign_up(email: 'person@example.com',
              password: 'bananas!')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: password
  click_button 'Sign up'
end

  scenario 'I can sign up as a new user' do
      expect { sign_up }.to change(User, :count).by(1)
      expect(page).to have_content('Welcome, person@example.com')
      expect(User.first.email).to eq('alice@example.com')
    end

end
