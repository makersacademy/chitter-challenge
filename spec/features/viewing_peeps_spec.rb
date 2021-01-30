feature "peeps" do
  scenario "user can see their username and a peep" do
    visit('/peeps')
    expect(page).to have_content("timmy_toes")
    expect(page).to have_content("I love this new app Chitter")
  end
end
