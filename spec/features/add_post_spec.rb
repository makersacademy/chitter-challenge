feature "Add a peep" do
  scenario "Add a peep to chitter" do
    visit('/')
    click_button('Add peep')
    expect(page).to have_content("Enter your peep")
  end
end