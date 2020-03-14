feature "post a peep" do
  scenario "creates a new peep" do
    visit('/peeps')
    fill_in(:peep, with: "This is a peep!")
    click_button("Post Peep!")
    expect(page).to_not have_content("This is a peep!")
  end
end
