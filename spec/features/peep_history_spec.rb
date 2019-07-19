# frozen_string_literal: true
# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'Peep History:' do
  scenario 'shows peeps in reverse chronological order' do
    post_peep('This is the first peep')
    post_peep('This is the second peep')
    post_peep('This is the third peep')
    expect(current_path).to eq '/view_peeps'
    'This is the third peep'.should appear_before('This is the second peep')
    'This is the second peep'.should appear_before('This is the first peep')
    expect(page.status_code).to eq(200)
  end
end
