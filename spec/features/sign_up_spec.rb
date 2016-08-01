feature "Users sign-up:" do
  scenario "user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, user@example.com')
    expect(User.first.email).to eq('user@example.com')
  end

end
