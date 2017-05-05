feature "Signing in" do
  let!(:user) do
    User.create(name: "Sophie",
      username: "sophie",
      email: 'sophie@example.com',
      password: "password",
      password_confirmation: "password")
  end
  scenario "user can sign in" do
    signin
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Welcome to Chitter, Sophie!')
  end
  scenario "user cannot sign in with incorrect password" do
    signin(password: 'wrong')
    expect(current_path).to eq '/sessions/new'
  end
end
