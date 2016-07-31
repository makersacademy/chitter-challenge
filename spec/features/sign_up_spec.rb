feature "Signing up" do
  scenario "A user can sign up for an account" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('example@email.com')
    expect(page).to have_content("Welcome to Chitter, example_username")
  end
end
