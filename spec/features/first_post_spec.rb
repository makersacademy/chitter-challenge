feature "first post" do
  scenario "user enters his first post" do
    visit '/add_peep'
    expect(page).to have_content("cheeter")
  end
end
