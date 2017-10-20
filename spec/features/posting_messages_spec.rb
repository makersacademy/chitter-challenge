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

  scenario 'user can view all messages in reverse chronological order' do
    Peep.create(text: 'added first')
    Peep.create(text: 'added second')
    Peep.create(text: 'added third')
    visit '/peeps'
    expect(page.find('li:first-child')).to have_content 'added third'
    expect(page.find('li:last-child')).to have_content 'added first'
  end

end