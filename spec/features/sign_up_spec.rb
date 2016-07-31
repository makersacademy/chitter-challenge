feature "Users sign-up:" do
  scenario "user can sign up" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, example@example.com')
    expect(User.first.email).to eq('example@example.com')
  end

end
