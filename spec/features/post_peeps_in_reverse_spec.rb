require 'features/web_helper'

feature 'post peeps in reverse order' do
  scenario 'see the most recent post first on chitter' do
    post_first_peep
    visit '/' 
    fill_in :peep_content, with: 'My second peep'
    click_button 'Post'
    visit '/peeps'
    expect(page.body).to match /#{'My second peep'}.*#{'My first peep'}/m
  end
end
