require 'spec_helper'

feature 'cant peep if not signed in' do

  before(:each) do
    user = User.create(name: 'name',
    username: 'user',
    email: 'test@test.com',
    password: 'password',
    password_conf: 'password')

    user.peeps.create(message: 'Hello',
    name: 'name',
    username: 'user')

    sign_in('test@test.com', 'password')
  end

  scenario 'cant view page' do
    visit ('/peeps')
    click_button 'Sign Out'
    visit ('/peeps')
    expect(page).to have_current_path('/')
  end
  scenario 'error message' do
    visit ('/peeps')
    click_button 'Sign Out'
    visit ('/peeps')
    expect(page).to have_content("Please sign in to view this page")
  end
end
