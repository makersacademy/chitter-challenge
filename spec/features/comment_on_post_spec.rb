feature 'Adding and viewing comments' do

  scenario "cannot comment whilst not logged in" do
    create_user_and_post
    
    visit('/')
    expect(page).to_not have_button 'Add Comment'
  end

  scenario 'a comment is added to a post' do
    post = create_user_and_post
    log_in

    first('.post').click_button 'Add Comment'

    expect(current_path).to eq "/add-comment/#{post.id}"

    fill_in 'comment', with: 'This is a test comment on this post'
    click_button 'Submit'

    expect(current_path).to eq '/'
    expect(first('.post')).to have_content 'This is a test comment on this post'
  end
end
