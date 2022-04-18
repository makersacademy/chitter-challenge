feature "Post button" do
  scenario "can create peeps" do
    signup_and_login
    fill_in 'description', with: "This is a test peep"
    click_button 'Post'
    expect(first('.details')).to have_content "John Doe"
    expect(first('.details')).to have_content "@JDoe123"
    expect(first('.list')).to have_content "This is a test peep"
  end

  scenario "won't allow the user to post an empty peep" do
    signup_and_login
    click_button 'Post'
    expect(page).not_to have_css('dd.list', text: "")
  end
end
