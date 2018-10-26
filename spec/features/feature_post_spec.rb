feature 'feature.post' do
  scenario 'Post a message to the timeline' do
    visit('/')
    click_button "Post"
    fill_in "message", with: "This is my first post to chitter"
    click_button "Post"
    expect(page). to have_content "This is my first post to chitter"
    expect(page). to have_content Time.now.strftime("%H:%M:%S")
  end
end
