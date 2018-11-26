feature "adding a peep" do
  scenario "adds a peep and shows it" do
    log_in
    visit '/peeps'
    click_button "Add peep"
    fill_in('content', with: 'Some content')
    click_button "Submit"
    expect(page).to have_content "Some content"
    expect(page).to have_content "My username"
  end
end
