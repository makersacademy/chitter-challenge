feature 'peep appearing on page' do
  scenario 'when a peep is made' do
    Peep.create(name: 'Hello World!')
    Tag.create(name: 'greeting,message' )
    fill_and_add_peep
    expect(page).to have_content('Hello World!')
    expect(page).to have_content('greeting', 'message')
  end
end

  feature 'filtering by tag' do
    scenario 'visit tags/hello and see all links tagged with hello' do
      visit '/'
      fill_in :post, with: 'Hello World'
      fill_in :tags, with: 'hello'
      click_button 'Post Peep'
      fill_in :chosen_tag, with: 'hello'
      visit '/tags/hello'
      expect(page).to have_content('Hello World')
    end
  end

  feature 'filtering by tag' do
    scenario 'visit tags/hello and not see taged with books' do
      fill_and_add_peep
      fill_in :chosen_tag, with: 'hello'
      visit '/tags/hello'
      expect(page).to_not have_content('greeting')
    end
  end

  feature 'adds multiple tags' do
    scenario 'shows multiple tags' do
      fill_and_add_peep
      post = Peep.last
      expect(post.tags.map {|tag| tag.name }).to include('greeting','message')
    end
  end
