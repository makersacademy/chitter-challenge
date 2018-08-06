feature 'log out brings you back to the main page so you can use another username' do
  scenario 'click logout and go back to index' do
    insert_username_and_go
    fill_in :peep, with: "This is my first peep!"
    click_button "Post!"
    click_button "Log Out!"
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
