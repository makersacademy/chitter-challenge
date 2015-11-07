feature "User signs up" do
  scenario "can sign up a new user" do
    expect { sign_up }.to change( User, :count ).by(1)
    expect(page).to have_content("Welcome, Ivan Sathianathan")
    expect(User.first.email).to eq "ivan@test.com"
  end
end
