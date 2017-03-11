feature "Writing a new peep" do
  scenario "User can write a new peep and view it on the peeps page" do
    sign_up
    write_a_peep
    expect(page).to have_content ("Bingaling peeped: It's sunny today :)")
  end
end
