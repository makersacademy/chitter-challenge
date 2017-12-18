feature 'Viewing peeps' do
  scenario 'user can view a series of peeps' do
    Peep.create(name: 'George', username: 'chunks', content: 'Ogres have layers!', time: '17:54 16/12/2017')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'Ogres have layers!'
      expect(page).to have_content '17:54 16/12/2017'
    end
  end

  scenario 'peeps appear in reverse chronological order' do
    Peep.create(name: 'George', username: 'chunks', content: 'Ogres have layers!', time: '17:54 16/12/2017')
    Peep.create(name: 'George', username: 'chunks', content: 'Donkey!!', time: '18:54 16/12/2017')
    visit '/peeps'
    within 'ul#peeps' do
      expect('Donkey!!').to appear_before('Ogres have layers!')
    end
  end
end
