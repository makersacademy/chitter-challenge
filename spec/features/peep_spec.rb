feature "Peeps" do
  scenario "User can post messages to chitter" do
    visit ("/")
    expect(page).to have_content "C H I T T E R"
    fill_in "peep", with: "This is my first peep"
    click_button "Send peep!"
    expect(page).to have_content "This is my first peep"
  end
end
