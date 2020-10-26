feature "registration" do
  scenario "Visit users/new, fill in details and see your name along with welcome on the main page" do
    visit "users/new"
    fill_in "username", with: "ds.danielh"
    fill_in "email", with: "dan@gmail.com"
    fill_in "full_name", with: "Dan Holmes"
    fill_in "password", with: "hunter2"
    click_button "Submit"
    expect(page).to have_content "Welcome, ds.danielh"
  end
end
