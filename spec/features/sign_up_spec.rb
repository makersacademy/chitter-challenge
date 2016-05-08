require 'spec_helper'

feature 'Viewing Links' do

  scenario 'should have a link to a sign-up page from the homepage' do
    visit('/')
    click_link('Sign up')
    expect(page).to have_content('Sign up for Chitter below')
    end
  end

  # scenario 'should show links filtered by tag' do
  #   Link.create(url: 'http://google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
  #   Link.create(url: 'http://yahoo.com', title: 'Yahoo', tags: [Tag.first_or_create(name: 'search')])
  #   visit('/tags/search')
  #   within('ul#links') do
  #     expect(page).to have_content('Google')
  #     expect(page).to have_content('Yahoo')
  #  end
  # end
# end
