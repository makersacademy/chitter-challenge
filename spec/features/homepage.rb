feature "homepage" do

  scenario "display home page" do
    visit ('/')
    expect(page).to have_content "Welcome to Chitter"
    expect(page).to have_button "Post a Peep"
    expect(page).to have_button "View Peeps"

  end
end