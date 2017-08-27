require './app/models/user'
require_relative 'web_helper'

feature 'new post action' do

  before do
    create_account
    log_in
    new_post
  end

  scenario 'has post table entry' do
    expect(Post.first(title: '1337 test post')).to_not eq(nil)
  end

  scenario 'displays post title' do
    expect(page).to have_content('1337 test post')
  end

  scenario 'displays post body' do
    expect(page).to have_content('this is a 1337 test')
  end

  scenario 'displays post author' do
    expect(page).to have_content('posted by: test')
  end

  scenario 'displays time of post' do
    expect(page).to have_content('at:')
  end
end
