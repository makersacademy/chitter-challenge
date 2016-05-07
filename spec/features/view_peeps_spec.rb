feature "view peeps" do
  scenario "view list of peeps" do
    sign_up
    create_peep
    create_peep("My second peep")
    visit "/peeps"
    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
  end
end
