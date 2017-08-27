feature 'Make peeps (messages)' do

  scenario 'I can see the textbox' do
  	visit '/peeps'
  	expect(page).to have_field("msg")
  end

  scenario 'user can post messages' do
    Peep.create(message: 'My First Peep')

    visit('/peeps')

    expect(page).to have_content 'My First Peep'
  end

end


  # scenario 'I can see my bookmarks' do
  # 	visit '/links/new'
  # 	fill_in("url", with: "http://www.google.co.uk")
  # 	fill_in("title", with: "Google")
  #   fill_in("tag", with: "Sports")
  # 	click_button("Add")
  # 	expect(current_path).to eq '/links'
  #   within 'ul#links' do
  # 	  expect(page).to have_content("Title: Google")
  #   end
  # end
  #
  # scenario 'Tags work' do
  # 	visit '/links/new'
  # 	fill_in("url", with: "http://www.google.co.uk")
  # 	fill_in("title", with: "Google")
  #   fill_in("tag", with: "Sports")
  # 	click_button("Add")
  #   link = Link.first
  #   expect(link.tags.map(&:name)).to include('Sports')
  #   end
