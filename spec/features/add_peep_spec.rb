feature "Post" do
  scenario "can create peeps" do
    signup_and_login
    fill_in 'description', with: "This is a test peep"
    click_button 'Post'
    expect(page).to have_content "This is a test peep"
  end
end
