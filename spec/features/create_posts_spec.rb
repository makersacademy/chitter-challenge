require 'spec_helper'

feature 'Create posts' do

  let(:user) do
    create(:user)
  end

  scenario 'user can add a post once logged in' do
    log_in(user)
    visit('/posts')
    expect(page).to have_content 'Create post'
    fill_in :message, with: 'random chitter chatter'
    expect(Post.count).to eq(1)
    expect(current_path).to eq '/posts'
      within 'ul#posts' do
        expect(page).to have_content("random chitter chatter")
        # expect(page).to have_content("loli")
      end
  end

  # scenario 'must be logged in' do
  #   visit '/posts/new'
  #   fill_in 'message', with: 'random chitter chatter'
  #   click_button('New post')
  #   expect(Post.count).to eq(0)
  #   expect(page).to have_content('Please log in to post messages')
  # end

end
