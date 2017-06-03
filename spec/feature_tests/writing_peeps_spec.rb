feature "Writing Peeps" do
  scenario "User Can visit a page to input a new peep" do
    visit "/"
    click_button "Make a Peep"
    expect(page).to have_content "Write your Peep below:"
  end
end
