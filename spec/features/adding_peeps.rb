feature "adding a peep" do
  scenario "adds a peep and shows it" do
    visit '/peeps'
    click_button "Add peep"
    fill_in('content', with: 'A bunch of content')
    fill_in('username', with: 'A super user')
    click_button "Submit"
    expect(page).to have_content "A bunch of content"
    expect(page).to have_content "A super user"
  end
end
