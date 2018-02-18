feature "Create peep" do
  scenario "User adds a peep" do
    visit '/'
    click_on "Create a peep"
    fill_in("text", with: "I love blooody dolphins. They are bloomin' marvellous")
    fill_in("author", with: "diverdude")
    click_on "Create this peep"
    expect(page).to have_content "bloomin' marvellous"
    expect(page).to have_content "diverdude"
  end
end
