feature "Signing out" do
  include Helpers
  let!(:user) do
    User.create(name: "Sophie",
      username: "sophie",
      email: 'sophie@example.com',
      password: "password",
      password_confirmation: "password")
  end
  scenario "user can sign out" do
    signin
    signout
    expect(page).to have_content('Goodbye!')
  end
end
