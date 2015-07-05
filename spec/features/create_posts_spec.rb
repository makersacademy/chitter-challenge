require 'spec_helper'

feature 'Create posts' do

  let(:user) do
    create(:user)
  end

  let(:post) do
    create(:post)
  end

  scenario 'user can add a post once logged in' do
    log_in(user)
    visit('/')
    click_button('New post')
    expect(page).to have_content 'Create post'
    expect{ post_message(post) }.to change(Post, :count).by(1)
    # post_message(post)
    # expect(Post.count).to eq(1)
    expect(current_path).to eq '/posts'
      within 'ul#posts' do
        expect(page).to have_content("#{post.message}")
        # expect(page).to have_content("loli")
      end
  end

end
