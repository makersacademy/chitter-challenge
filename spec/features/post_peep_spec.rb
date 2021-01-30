feature "user to post message" do
  scenario "to display a peep" do
    visit '/add_peep'
    fill_in "peep", with: "Hello chitter!"
    fill_in "user", with: "Louis"
    click_on "Post Peep!"
    expect(page).to have_content "Hello chitter!"
  end
end
