feature "You can add a peep" do

  scenario "The user adds a peep" do
    visit('/')
    expect(page).to have_content('Test peep 1')
    expect(page).to have_content('Test peep 2')
    expect(page).to have_content('Test peep 3')
  end

end
