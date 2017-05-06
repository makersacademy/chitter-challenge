feature 'User can sign in' do
  let!(:user) do
    User.create(name: "Bertie", email: "Test.email@test.com", username: "BertZ", password: "Password1234", password_confirmation: "Password1234")
  end

  scenario 'Can sign in with correct information' do
    sign_in(username: user.username, password: user.password)
    expect(page).to have_content("Welcome to Chitter #{user.username} ")
  end
end
