require './spec/spec_helper'

  feature 'Add tag to a link' do
    scenario 'I want to add a tag to a link' do
      visit '/links/new'

      fill_in 'url',   with: 'http://www.bbc.com'
      fill_in 'title', with: 'BBC News'
      fill_in 'tags',  with: 'news'

      click_button 'Add site'
      link = Link.first
      expect(link.tags.map(&:name)).to include('news')
    end

    scenario 'I want to add multiple tags to a link' do
      visit '/links/new'

      fill_in 'url',   with: 'http://www.bbc.com'
      fill_in 'title', with: 'BBC News'
      fill_in 'tags',  with: 'news bbc current_affairs'

      click_button 'Add site'
      link = Link.first
      expect(link.tags.map(&:name)).to include('news', 'bbc', 'current_affairs')
    end
  end
