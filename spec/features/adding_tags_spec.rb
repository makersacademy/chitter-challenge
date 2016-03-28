feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/new'
    fill_in 'post',   with: 'http://www.makersacademy.com/'
    fill_in 'tags',  with: '#Lads'
    click_button 'Chit'
    chit = Chit.first
    expect(chit.tags.map(&:name)).to include('#Lads')
  end
end
