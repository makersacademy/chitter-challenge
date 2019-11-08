feature "View peep" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content "Chitwits"
  end

  scenario "a user can see all the peeps" do
    visit("/chitcreek")
    fill_in("peep", with: "This is a peep")
    click_button("Peep")

    expect(page).to have_content "This is a peep"
  end

  #   scenario "a user sees peeps in reverse order" do
  #     visit("/chitcreek")
  #     fill_in("peep", with: "This is a peep")
  #     click_button("Peep")
  #     fill_in("peep", with: "This is another peep")
  #     click_button("Peep")
  #     fill_in("peep", with: "This is the lucky third peep")
  #     click_button("Peep")

  #     expect(page).to have_content "This is the lucky third peep, This is another peep, This is a peep"
  #   end
end
