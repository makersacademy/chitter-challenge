require './app/models/user'
require_relative 'web_helper'

feature 'post form' do

  before do
    create_account
    log_in
  end

  scenario 'displays form title' do
    expect(page).to have_content('Create New Post')
  end

  scenario 'displays \'posting as\' username' do
    expect(page).to have_content('posting as: test')
  end

  scenario 'displays post title input' do
    expect(page).to have_content('post title')
  end

  scenario 'displays post text input' do
    expect(page).to have_content('post body')
  end

  scenario 'can create form' do
    expect(page).to have_content('post body')
  end
end
