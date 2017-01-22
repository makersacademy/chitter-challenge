feature "sign in" do
let(:user) do
  User.create(name: 'test', email: 'test@test.com', password: 'password01', password_confirmation: 'password01')
end

scenario 'signs in correctly' do
  sign_in(email: user.email, password: user.password)
  expect(page).to have_content "Welcome, #{user.name}"
end

scenario 'a user can not sign up when signed in' do
  sign_in(email: user.email, password: user.password)
  visit '/users/new'
  expect(page).to have_content("You are already signed in")
  expect(page).not_to have_content("What should we call you?")
end


end
