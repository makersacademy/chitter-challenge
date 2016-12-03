feature "sign in" do
let(:user) do
  User.create(name: 'test', email: 'test@test.com', password: 'password01', password_confirmation: 'password01')
end

scenario 'signs in correctly' do
  sign_in(email: user.email, password: user.password)
  expect(page).to have_content "Welcome, #{user.name}"
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

end
