require 'spec_helper'

feature 'viewing and posting peeps' do

  scenario 'user can post a peep' do
    visit('/peeps')
    expect(page).to have_field('peep')
    expect(page).to have_button('Post')
    fill_in 'peep', with: 'Hello, this is my first peep on Chitter!'
    click_button 'Post'
    expect(page).to have_content('Hello, this is my first peep on Chitter!')
  end

  scenario 'user can see peeps in a reverse chronological order' do
  	visit('/peeps')
  	fill_in 'peep', with: "Second peep!"
  	click_button('Post')
  	peeps = Peep.all(order: [:created_at.desc])
  	expect(peeps[0].content).to eq('Second peep!')
  end
  
end
