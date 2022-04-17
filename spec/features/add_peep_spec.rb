feature "Post" do
  scenario "can create peeps" do
    visit '/peeps'
    fill_in 'description', with: "This is a test tweet"
    click_button 'Post'
    expect(page).to have_content "This is a test tweet"
  end
end
