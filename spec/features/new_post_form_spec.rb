require './app/models/user'
require_relative 'web_helper'

feature 'home page new post form' do

  before do
    create_account
  end

  scenario 'displays form title' do
    expect(page).to have_content('Create New Post')
  end

  scenario 'displays \'posting as\' username' do
    expect(page).to have_content('posting as: test')
  end

  scenario 'displays text input' do
    expect(page).to have_content('say something...')
  end

end
