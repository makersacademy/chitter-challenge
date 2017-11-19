feature "creating new peeps" do
  scenario "/new_peep provides prompts a user to enter a new peep" do
    visit "/new_peep"
    expect(page).to have_content "Peep:"
  end
  scenario "/new_peep allows to submit a form" do
    visit "/new_peep"
    expect(page).to have_button "Post"
  end
  scenario "form submission creates a new peep with a message attribute" do
    visit "/new_peep"
    fill_in("peep", with: "This is a test peep")
    click_button "Post"
    last_peep = Peep.last
    expect(last_peep.message).to eq("This is a test peep")
  end
end
