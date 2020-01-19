feature "post a message" do
  scenario "it lets the user post a message" do
    visit('/messages')
    fill_in 'username', with: "Marcellofabbri"
    click_button 'Login'
    fill_in 'content', with: "Cool stuff"
    click_button "Publish"

    expect(page).to have_content "Cool stuff"
  end

  scenario "it signs every post with the username" do
    visit '/messages'
    fill_in 'username', with: "Marcellofabbri"
    click_button 'Login'
    fill_in 'content', with: "Here I am"
    click_button "Publish"
    expect(page).to have_content "by Marcellofabbri"
  end
end