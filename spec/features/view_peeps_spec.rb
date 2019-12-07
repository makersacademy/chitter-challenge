feature "viewing list of peeps" do
  scenario "lists all peeps" do
    sign_in
    expect(page).to have_content("this is peep1")
    expect(page).to have_content("this is peep2")
    expect(page).to have_content("this is peep3")
  end

end