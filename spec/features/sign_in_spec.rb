feature "Sign in" do
  scenario "signs in and welcomes you if valid" do
    register
    sign_out
    visit "/sessions/new"
    fill_in "username", with: "ds.danielh"
    fill_in "password", with: "hunter2"
    click_on "Submit"

    expect(page).to have_content "Welcome back, ds.danielh"
  end
  scenario "gives error if invalid" do
    register
    sign_out
    visit "/sessions/new"
    fill_in "username", with: "ds.danielh"
    fill_in "password", with: "nicetry"
    click_on "Submit"

    expect(page).to have_content "Incorrect username/password"
  end
end
