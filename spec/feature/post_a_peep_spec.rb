feature "create a peep" do
  scenario "peep is added" do
    visit "/"
    fill_in "new_peep", with: dummy_text
    click_button "Peep!"
    expect(page).to have_content(dummy_text)
  end
end