feature "Time" do
  scenario "the time a peep was made is displayed" do
    visit '/peeps'
    fill_in 'description', with: "This is a test peep"
    click_button 'Post'
    peep = Peep.first
    expect(page).to have_content peep.format_time.to_s
  end
end
