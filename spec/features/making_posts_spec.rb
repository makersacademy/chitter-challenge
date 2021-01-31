feature "posting" do 

  scenario "making a post" do
    go_to_index_page_and_register_a_new_user
    successful_sign_in
    submit_a_post
    new_post = Post.last

    expect(new_post.author_name).to eq "Author name"
    expect(new_post.text).to eq "writing a peep"

    expect(first(".post")).to have_content "writing a peep"
    expect(page).to have_content "Author name"
    expect(page).to have_content "writing a peep"
  end

  scenario "see posts in reverse chronological order" do
    go_to_index_page_and_register_a_new_user
    successful_sign_in
    submit_a_post
    submit_another_post

    expect(first(".post")).to have_content "second peep"
    expect(page).to have_content "writing a peep"
    expect(page).to have_content "Author name"
  end


end
