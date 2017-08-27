feature 'Make peeps (messages)' do

  scenario 'user can post messages' do
    Peep.create(message: 'My First Peep')

    visit('/peeps')

    within "ul#peeps" do
    expect(page).to have_content 'My First Peep'
    end
  end

  scenario 'I can see the textbox' do
    visit '/peeps/new'
    expect(page).to have_field("msg")
  end

  scenario 'I can see my peeps' do
    visit '/peeps/new'
    fill_in("msg", with: "Hello World")
    click_button("Post")
    expect(current_path).to eq '/peeps'
    within 'ul#peeps' do
    	 expect(page).to have_content("Hello World")
    end
  end
end


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
