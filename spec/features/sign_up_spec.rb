require './app/models/user'

feature "sign up" do
  scenario "user can sign up using a form" do
    visit "/signup"
    expect(page.status_code).to eq 200
  end
  scenario "user sees welcome message after signing up" do
    signup
    expect(page).to have_content "Welcome Richard"
  end
  scenario "user details are saved to the database" do
    signup
    expect(User.first.email).to eq "richard@gmail.com"
  end
end
