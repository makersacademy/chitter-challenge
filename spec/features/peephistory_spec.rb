feature "Peep History is visible when signed in" do
  scenario "A signed in Maker can see their first posted peep" do
    signuptest
    logintest
    createpeep
    expect(page).to have_content("Hello, world")
  end

  scenario "A Maker is able to see a history of peeps" do
    signuptest
    logintest
    createpeep
    click_button "Profile"
    createsecondpeep
    expect(page).to have_content("Hello, world")
    expect(page).to have_content("Hello again, world")
  end
end
