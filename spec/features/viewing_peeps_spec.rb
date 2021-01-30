feature "viewing all peeps" do
  scenario "wanting to see all the peeps" do
    visit('/peeps')
    expect(page).to have_content "This is a peep"
  end
end