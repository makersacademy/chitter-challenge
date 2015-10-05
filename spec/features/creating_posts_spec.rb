require 'spec_helper'

feature 'Creating posts' do

  let(:user){build :user}

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name,     with: user.name
    fill_in :handle,   with: user.handle
    fill_in :email,    with: user.email
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end


  scenario 'user can add a post once logged in' do
    sign_up(user)
    expect(page).to have_content 'Welcome, Sarah'
    visit('/posts/new')
    expect(page).to have_content 'Create post'
    fill_in :message, with: 'hello world'
    click_button 'Post'
    expect(Post.count).to eq(1)
    expect(current_path).to eq'/posts'
      within 'ul#posts' do
        expect(page).to have_content('hello world ')
      end
  end

end