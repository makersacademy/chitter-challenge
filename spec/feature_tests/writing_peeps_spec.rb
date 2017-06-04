require_relative "web_helpers"

feature "Writing Peeps" do
  scenario "User Can visit a page to input a new peep" do
    register_user
    click_button "Make a Peep"
    expect(page).to have_content "Write your Peep below:"
  end
  scenario "User can write a new peep and see it on a new page" do
    register_user
    make_peep
    expect(page).to have_content "Lorem ipsum dolor sit amet."
  end
  scenario "Peeps show the time they were created" do
    register_user
    make_peep
    expect(page).to have_content "#{Time.now.strftime('%d %b, %Y at %H:%M')}"
  end
  scenario "Peeps can't be written if the user isn't signed in" do
    visit "/"
    expect(page).not_to have_content "Make a Peep"
  end
  scenario "App will raise an error if user tries to visit /new_peep directly" do
    visit "/new_peep"
    expect(page.status_code).to eq(403)
  end
  scenario "Peeps show who created them" do
    register_user
    make_peep
    expect(page).to have_content "Peep by: Test"
  end
end
