feature "first post" do
  scenario "user enters his first post" do
    visit '/'
    expect(page).to have_content("cheeter")
  end
end
