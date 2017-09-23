feature 'Adding tags' do
  scenario 'I can add a single tag to a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'Hello, world!'
    fill_in 'tags', with: 'greeting'
    click_button 'Post'
    peep = Peep.first
    expect(peep.tags.map(&:name).to include('greeting'))
  end

  scenario 'I can add multiple tags to a new peep' do
    visit '/peeps/new'
    fill_in 'message', with: 'Hello, world!'
    fill_in 'tags',  with: 'greeting programming'
    click_button 'Post'
    peep = Peep.first
    expect(peep.tags.map(&:name)).to include('greeting', 'programming')
  end
end
