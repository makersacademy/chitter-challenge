require 'spec_helper'

feature 'post peeps' do

  before(:each) do
    User.create(email: 'newuser@gmail.com',
                password: 'password123',
                password_confirmation: 'password123',
                username: 'newnew',
                name: 'mew')
  end

  scenario 'able to post a peep' do
    sign_in(email: 'newuser@gmail.com', password: 'password123')
    expect(page).to have_content('Welcome, newuser@gmail.com')
    click_button "New post"
    fill_in :content, with: "Test post"
    click_button "Add"
    expect(page).to have_content("Test post")
  end

  scenario 'unable to post peep if not logged in' do
    visit '/peeps'
    click_button "New post"
    expect(page).to have_content("Please login to post a new peep")
  end

  scenario 'posted peep has date, time, username and name' do
    sign_in(email: 'newuser@gmail.com', password: 'password123')
    expect(page).to have_content('Welcome, newuser@gmail.com')
    click_button "New post"
    fill_in :content, with: "Test post"
    click_button "Add"
    expect(page).to have_content("mew")
    expect(page).to have_content("2016-10-23")
    expect(page).to have_content("newnew")
  end

end
