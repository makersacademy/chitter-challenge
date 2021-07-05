feature "wall" do
  scenario "displays tweets in reverse chronological order" do
    visit('/')
    page.fill_in 'peep', with: 'First chitter!'
    click_button("Peep!")
    expect(page).to have_content "First chitter!"
  end
end