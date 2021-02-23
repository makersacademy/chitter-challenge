feature "posting" do 

  scenario "making a post" do
    go_to_index_page_and_register_a_new_user
    successful_sign_in
    submit_a_post
    new_post = Post.last
    user = User.last

    expect(new_post.text).to eq "writing a peep"
    expect(user.username).to eq "tester"

    expect(new_post.user_id).to eq user.id

    expect(first(".post")).to have_content "writing a peep"
    expect(page).to have_content "Peeped by tester"
    expect(page).to have_content "writing a peep"
  end

  scenario "see posts in reverse chronological order" do
    go_to_index_page_and_register_a_new_user
    successful_sign_in
    submit_a_post
    submit_another_post

    expect(first(".post")).to have_content "second peep"
    expect(page).to have_content "writing a peep"
  end


end
