feature "creating new peeps" do
  scenario "/new_peep provides prompts a user to enter a new peep" do
    sign_up
    visit "/peeps/new"
    expect(page).to have_content "Peep:"
  end
  scenario "/new_peep allows to submit a form" do
    sign_up
    visit "/peeps/new"
    expect(page).to have_button "Post"
  end
  scenario "form submission creates a new peep with a message attribute" do
    sign_up_and_post_peep
    last_peep = Peep.last
    expect(last_peep.message).to eq("This is a test peep")
  end
end
