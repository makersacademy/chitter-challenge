feature 'Adding tags' do
  scenario 'I can add a single tag to a new link' do
    visit '/peeps/new'
    fill_in 'content', with: 'This is a peep about a chicken'
    fill_in 'tags', with: 'poultry'

    click_button 'Post peep'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('poultry')
  end

  scenario 'I can add multiple tags to a new peep' do
    visit '/peeps/new'
    fill_in 'content', with: 'This is a peep about horses'
    fill_in 'tags', with: 'equine mammal'
    click_button 'Post peep'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('equine', 'mammal')
  end
end
