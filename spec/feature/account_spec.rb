
feature 'User has acess to their account page' do
  scenario 'I can sign up as a new user' do
  expect {sign_up }.to change(User, :count).by(1)
  expect(page).to have_content('Welcome, test@example.com')
  expect(User.first.email).to eq('test@example.com')
  end
end
