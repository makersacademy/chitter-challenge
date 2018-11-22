feature 'view peeps' do

  scenario 'view peeps' do
    Peep.create(description: 'test information')
    visit('/')
    expect(page).to have_content('test information')
  end

  scenario 'view peeps in reverse chronological order' do
    Peep.create(description: 'one')
    Peep.create(description: 'two')
    Peep.create(description: 'three')
    visit('/')
    expect(page.find('li:nth-child(3)')).to have_content 'one'
  end

  scenario 'view time the peep was made' do
    Peep.create(description: 'one')
    Peep.create(description: 'two')
    Peep.create(description: 'three')
    visit('/')
    
  end

end
