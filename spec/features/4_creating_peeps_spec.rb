feature "Peeping" do
  scenario "can add peeps on the homepage" do
    visit "/peeps"
    click_button "Add a peep"
    fill_in "peep_text", with: "Hi, this is a new peep!"
    click_button 'Peep'
    expect(page).to have_content("Hi, this is a new peep!")
  end
end
