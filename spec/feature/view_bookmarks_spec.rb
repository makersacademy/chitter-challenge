require 'spec_helper'

feature 'viewing bookmarks' do
  let!(:bookmark) { Bookmark.create(url: 'test_url') }

    scenario 'are on the page' do
      visit '/bookmarks'
      expect(page).to have_content(bookmark.url)  
    end
end