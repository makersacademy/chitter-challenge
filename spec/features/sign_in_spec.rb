feature 'user sign in' do
  let(:user) do
    User.new(name: 'Alex Jones', username: 'AJones', password: 'password123', email_address: 'test123@123email.com')
    end
    scenario 'with correct login details' do
      user.save!
      sign_in(email: user.email_address, password: user.password)
      expect(page).to have_content 'Hello Alex Jones'
      expect(current_path).to eq '/peeps'
    end
    scenario 'with incorrect login details' do
      user.save!
      sign_in(email: user.email_address, password: "wrong_password")
      expect(page).to have_content 'The email or password provided is incorrect'
      expect(current_path).to eq '/sessions'
    end
end
