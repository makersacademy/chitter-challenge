require 'spec_helper'

feature 'filtering links by tags' do
  scenario 'should be able to filter the bookmarks by specific tags' do
    visit ('/links')
    click_button 'Create New Bookmark'
    fill_in :title, with: 'Kitten pics'
    fill_in :url, with: 'https://google.com/images?q=cute%20kittens'
    fill_in :tags, with: 'kittens'
    click_button 'Add Link'
    click_button 'Create New Bookmark'
    fill_in :title, with: 'Puppy pics'
    fill_in :url, with: 'https://google.com/images?q=cute%20puppies'
    fill_in :tags, with: 'puppies'
    click_button 'Add Link'
    click_button 'Create New Bookmark'
    fill_in :title, with: 'Young cat pics'
    fill_in :url, with: 'https://google.com/images?q=young%20cat'
    fill_in :tags, with: 'kittens'
    click_button 'Add Link'

    visit ('/tags/kittens')

    expect(page).not_to have_content("Puppy pics")
    expect(page).to have_content("Kitten pics")
    expect(page).to have_content("Young cat pics")
  end

  scenario 'should be able to add multiple tags' do
    visit ('/links')
    click_button 'Create New Bookmark'
    fill_in :title, with: 'Kitten pics'
    fill_in :url, with: 'https://google.com/images?q=cute%20kittens'
    fill_in :tags, with: 'kittens, cute'
    click_button 'Add Link'

    expect(page).to have_link('kittens', href: '/tags/kittens')
    expect(page).to have_link('cute', href: '/tags/cute')
  end
end
