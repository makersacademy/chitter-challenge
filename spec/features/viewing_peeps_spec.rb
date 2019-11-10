require 'orderly'
require_relative 'web_helpers'

feature 'viewing peeps' do
  scenario 'user can view all peeps' do
    post_peep
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'hello, world'
  end

  scenario 'user can see all peeps in reverse chronological order' do
    post_peep
    visit('/')
    fill_in :add_peep, with: 'how are you today?'
    click_button 'Post'
    visit('/peeps')
    expect('hello, world').to appear_before('how are you today?')
  end
end
