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

end
