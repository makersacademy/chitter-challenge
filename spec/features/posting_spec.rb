# So that I can let people know what I'm doing
# I want to post a message to Chitter
feature 'New Posts' do
  scenario 'Creates a new post in the database upon posting chit' do
    register_new_user
    fill_in(:chit, with: 'This is a new post!')
    click_button('Post!')
    expect(Post.count).to eq(1)
  end

  scenario "'Posts' post on the wall for everyone to see" do
    register_new_user
    fill_in(:chit, with: 'Post for all to see!')
    click_button('Post!')
    expect(page).to have_content("Post for all to see!")
  end

  scenario "Posts indicate person who submitted the post" do
    register_new_user
    fill_in(:chit, with: 'Name test!')
    click_button('Post!')
    expect(page).to have_content("James Borrell:")
  end

  scenario "Post shows time created/posted" do
    register_new_user
    fill_in(:chit, with: 'Time test!')
    click_button('Post!')
    time = (Time.new).strftime("%H:%M - %D")
    expect(page).to have_content("Posted at: #{time}")
  end

end
