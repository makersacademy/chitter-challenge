feature "viewing all peeps" do
  scenario "a user can view a list of peeps in reverse chronological order" do
    Peep.create(text: "I am the first peep created")
    Peep.create(text: "I am second one")
    Peep.create(text: "And I am the last one")

    visit '/peeps'

    expect(page).to have_content("I am the first peep created")
    expect(page).to have_content("I am second one")
    expect(page).to have_content("And I am the last one")
    expect(first('.media')).to have_content("And I am the last one")
  end
end