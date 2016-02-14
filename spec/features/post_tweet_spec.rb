require 'spec_helper'

feature 'post tweets as a user' do

  scenario 'post tweets' do
    visit '/post_tweet'
    fill_in :message, with: 'asdfgh'
    click_button 'submit'
    expect(page).to have_content('asdfgh')
  end

end
