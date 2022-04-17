feature "Display" do
  scenario "shows peeps in reverse chronological order" do
    visit '/peeps'
    fill_in 'description', with: "This is the first test peep"
    click_button 'Post'
    fill_in 'description', with: "This is the second test peep"
    click_button 'Post'
    expect(first('.list')).to have_content "This is the second test peep"
  end
end
