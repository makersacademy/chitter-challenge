feature "Signing up" do
  scenario "A user can sign up for an account" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('example@email.com')
    expect(page).to have_content("Welcome to Chitter, example_username")
  end
end

feature "Signing in" do
  scenario "A user can sing in to their account" do
    sign_up
    sign_in
    expect(page).to have_content("Welcome back, example_username")
  end
end
