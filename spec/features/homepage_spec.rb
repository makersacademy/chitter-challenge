feature "visit homepage" do
  scenario "it has a welcome message" do
    visit '/chitter'
    expect(page).to have_content "Chitty Chitty Bang Bang!"
  end

  scenario "it displays all the peeps posted" do
    test_database_setup
    
    visit '/chitter'
    fill_in "content", with: "Hello World!"
    click_button "Peep peep"
    fill_in "content", with: "This breakfast is amazing!"
    click_button "Peep peep"

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "This breakfast is amazing!"
  end
end
