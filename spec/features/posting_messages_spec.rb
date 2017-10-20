feature 'posting messages to chitter' do

  text = 'Consequat ea in voluptate magna est veniam non laboris pariatur reprehenderit culpa consectetur.'

  scenario 'user can post a message to chitter' do
    
    visit '/peeps/new'
    fill_in :peep, with: text
    fill_in :handle, with: '#ainsleybc'
    fill_in :name, with: 'Ainsley Chang'
    click_button 'Post'
    visit '/peeps'
    expect(page).to have_content text
  end

end