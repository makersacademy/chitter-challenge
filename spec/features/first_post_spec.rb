feature "first post" do
  scenario "user enters his first post" do
    visit '/add_peep'
    expect(page).to have_content "Enter your peep and share it with the world!"
  end
end
