require 'spec_helper'

feature 'searching by user handle' do

  before do
    sign_up
    fill_in 'note', with: 'Test note'
    click_button 'Post'
  end

  scenario 'user clicks on an author\'s handle on homepage' do
    click_link 'Joe Bloggs'
    expect(page).to have_content 'Test note'
  end

end

feature 'searching by hashtag' do

  before do
    sign_up
    fill_in 'note', with: 'Test note #amazeballs #fantastic'
    click_button 'Post'
  end

  scenario 'user clicks on a hashtag on homepage' do
    click_link '#amazeballs'
    expect(page).to have_content 'Test note'
  end

end