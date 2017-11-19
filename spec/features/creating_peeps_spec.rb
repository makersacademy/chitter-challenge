feature "creating new peeps" do
  scenario "/new-peep provides prompts a user to enter a new peep" do
    visit "/new_peep"
    expect(page).to have_content "Peep:"
  end
  scenario "/new-peep allows to submit a form" do
    visit "/new_peep"
    expect(page).to have_button "Post"
  end
end
