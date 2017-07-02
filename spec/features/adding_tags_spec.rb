feature 'Adding tags' do
  scenario 'add a tag to a new peep' do
    visit '/peeps/new'
    fill_in :message, with: 'I love pancakes'
    fill_in :tags, with: 'food'
    click_button('Post new Peep')
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('food')
  end

  scenario 'add multiple tags to a new peep' do
    visit '/peeps/new'
    fill_in :message, with: 'I love pancakes'
    fill_in :tags, with: 'food, nomnoms'
    click_button('Post new Peep')
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('food', 'nomnoms')
  end
end
