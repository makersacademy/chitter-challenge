feature "Writing a new peep" do
  scenario "User can write a new peep and view it on the peeps page" do
    sign_up
    write_a_peep
    expect(page).to have_content ("It's sunny today :)")
  end

  scenario "Peep is posted with the date, time and user" do
    sign_up
    write_a_peep
    expect(page).to have_content ("It's sunny today :)")
    expect(page).to have_content ("Bingaling posted on")
  end
end
