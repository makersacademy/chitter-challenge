feature "View Peep" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content "Chitwits"
  end

  scenario "a user can see all the Peeps" do
    visit("/chitcreek")
    click_button("Peep a chit")
    fill_in("new_chit", with: "This is a Peep")
    click_button("Peep!")
    expect(page).to have_content "This is a Peep"
  end

  scenario "a user sees Peeps in reverse order" do
    visit("/chitcreek")
    click_button("Peep a chit")
    fill_in("new_chit", with: "This is a Peep")
    click_button("Peep!")
  click_button("Peep a chit")
  fill_in("new_chit", with: "This is another Peep")
  click_button("Peep!")
  click_button("Peep a chit")
  fill_in("new_chit", with: "This is the lucky third Peep")
  click_button("Peep!")

    expect(page).to have_content "This is the lucky third Peep, This is another Peep, This is a Peep"
  end
end
