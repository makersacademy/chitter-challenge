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
    expect(page).to have_content "Welcome to Shitter, #{user.name}"
  end
end

feature "FEATURE: Sign-out" do
  let!(:user) do
    User.create(name: 'Solid Snake',
                username: 'snake',
                email: 'snake@mgs.com',
                password: 'mgs1',
                password_confirmation: 'mgs1')
  end

  scenario "while being signed in" do
    sign_in(email: 'snake@mgs.com', password: 'mgs1')
    click_button 'Sign out'
    expect(page).to have_content("Goodbye!")
    expect(page).not_to have_content("Welcome to Shitter, #{user.name}")
  end
end
