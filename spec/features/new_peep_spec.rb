
feature "new peep" do
  scenario "allows user to add a peep" do
    visit '/peeps/new'
    fill_in 'peep', with: "Test peep"
    click_button 'Post'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Test peep'
  end
end
