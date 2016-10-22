feature "creating links" do
  scenario "I want to create links" do
    visit '/links/new'
    fill_in :title, with: 'Ruby Gems'
    fill_in :url, with: 'https://rubygems.org'
    click_button 'Add Link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Ruby Gems')
    end
  end

  scenario "I want to create a link with a tag" do
    visit '/links/new'
    fill_in :title, with: 'Kitten pics'
    fill_in :url, with: 'https://images.google.com/?q=cute%20kittens'
    fill_in :tags, with: 'kittens'
    click_button 'Add Link'

    link = Link.first
    expect(link.tags.map(&:name)).to include('kittens')
  end
end
