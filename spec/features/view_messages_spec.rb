feature 'View messages' do
  scenario 'user can view messages on a feed'  do
    Message.post(username:'riya', message: "Happy Easter")
    visit '/chitter_feed'
    expect(page).to have_content "@riya: Happy Easter"
  end
end
