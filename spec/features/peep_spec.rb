feature "Peeps" do
  scenario "User can post a messages to chitter" do
    visit ("/profile")
    expect(page).to have_content "C H I T T E R"
    fill_in "peep", with: "This is my first peep"
    click_button "Send peep!"
    expect(page).to have_content "This is my first peep"
  end

  scenario "User can post multiple messaeges to chitter" do
    visit ("/profile")
    fill_in "peep", with: "First message"
    click_button "Send peep!"
    fill_in "peep", with: "Second message"
    click_button "Send peep!"
    expect(page).to have_content "First message"
    expect(page).to have_content "Second message"
  end
end
