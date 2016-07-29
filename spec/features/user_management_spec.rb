feature "User sign up" do
  scenario "New users can sign up to Chitter" do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, yuri@test.com')
    expect(User.first.email).to eq('yuri@test.com')
  end
end
