feature "Add a peep" do
  scenario "User adds a peep to chitter" do
    visit '/peeps/new'
    fill_in('peep', with: 'My first peep')
    click_button('Post')
    expect(page).to have_content("My first peep")
  end
end
