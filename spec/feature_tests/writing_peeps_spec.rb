require_relative "web_helpers"

feature "Writing Peeps" do
  scenario "User Can visit a page to input a new peep" do
    visit "/"
    click_button "Make a Peep"
    expect(page).to have_content "Write your Peep below:"
  end
  scenario "User can write a new peep and see it on a new page" do
    make_peep
    expect(page).to have_content "Lorem ipsum dolor sit amet."
  end
  scenario "Peeps show the time they were created" do
    make_peep
    expect(page).to have_content "#{Time.now.strftime('%d %b, %Y at %H:%M')}"
  end
end
