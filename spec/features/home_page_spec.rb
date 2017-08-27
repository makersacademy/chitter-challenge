require './app/models/user'
require_relative 'web_helper'

feature 'home page when not logged in' do

  before do
    go_to_home_page
  end

  scenario 'does not display form for new posts' do
    expect(page).to_not have_content('Create New Post')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'redirects to login form' do
    expect(current_path).to eq '/login'
  end

end

feature 'home page when logged in' do

  before do
    create_account
    log_in
  end

  scenario 'can create account and log in' do
    expect(current_path).to eq('/')
  end

  scenario 'displays latest posts' do
    expect(page).to have_content('Lastest Posts')
  end

  scenario 'displays form for new posts' do
    expect(page).to have_content('Create New Post')
  end

end
