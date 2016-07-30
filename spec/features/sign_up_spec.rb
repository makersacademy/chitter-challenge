require './app/models/user'

feature "sign up" do
  scenario "user can visit sign up page" do
    visit "/signup"
    expect(page.status_code).to eq 200
  end
  scenario "user sees welcome message after signing up" do
    signup
    expect(page).to have_content "Welcome richard@gmail.com!"
  end
  scenario "user details are saved to the database" do
    expect {signup}.to change(User, :count).by(1)
    expect(User.first.email).to eq "richard@gmail.com"
  end
end
