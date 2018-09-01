feature "can post a peep" do
  scenario "can submit a peep" do
    visit("/")
    fill_in 'new_peep', with: "This is a post."
    click_button 'Submit'
    expect(page).to have_content("This is a post.")
  end
end