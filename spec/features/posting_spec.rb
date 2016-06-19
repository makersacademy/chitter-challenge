
feature 'Users can create a post' do
  before(:each) do
    sign_up
    post_message
  end

  scenario 'User creates a post' do
    expect(current_path).to eq '/'
    post = Post.first(user_id: 1)
    expect(post.message).to include('This is the best app ever!')
    expect(page).to have_content 'This is the best app ever!'
  end
end

xfeature 'Users name is displayed on the post' do
  scenario '' do

  end
end

feature 'Users can view the time a post was created' do
  scenario 'User creates post and views the time on the index page' do
    sign_up
    post_message
    post = Post.first(user_id: 2)
    expect(page).to have_content "#{post.created_at.strftime("%d/%m/%Y %H:%M:%S")}"
  end
end

feature 'Users change the chronological order of posts' do
  before(:each) do
    sign_up
    post_message
  end

  scenario 'user clicks a button to view posts oldest first' do
    post_message(comment: 'This is the second message!')
    click_button 'Oldest first!'
      within 'li#highest' do
      expect(page).to have_content('This is the second message!')
      expect(page).not_to have_content('This is the best app ever!')
    end
  end

  scenario 'user clicks a button to view posts newest first' do
    post_message(comment: 'This is the second message!')
    click_button 'Oldest first!'
    click_button 'Newest first!'
    within 'li#highest' do
      expect(page).to have_content('This is the best app ever!')
      expect(page).not_to have_content('This is the second message!')
    end
  end
end

feature 'login notice if not logged in and trying to post' do
  scenario 'user trys to post without logging in' do
    post_message
    expect(page).to have_content('Please sign in to post!')
  end
end
