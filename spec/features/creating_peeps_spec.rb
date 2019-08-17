require 'pg'
require 'spec_helper'

feature 'posting messages:' do
  scenario 'it posts a message to Chitter' do
    visit('/')
    fill_in('text', with: 'this is the first message')
    click_button 'Post'
    expect(page).to have_content 'this is the first message'
  end
end
