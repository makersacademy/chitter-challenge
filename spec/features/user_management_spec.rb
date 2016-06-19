feature "FEATURE: Sign-in" do
  let!(:user) do
    User.create(name: 'Solid Snake',
                username: 'snake',
                email: 'snake@mgs.com',
                password: 'mgs1',
                password_confirmation: 'mgs1')
  end

  scenario "can sign in with correct credentials" do
    sign_in(email: user.email,
            password: user.password)
    expect(page).to have_content "Welcome, #{user.name}"
  end
end
