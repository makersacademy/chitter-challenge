# frozen_string_literal: true

# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Posting a peep:' do
  scenario 'posts a peep' do
    post_peep('This is a test peep 123!')
    expect(current_path).to eq '/view_peeps'
    expect(page).to have_content('This is a test peep 123!')
    expect(page.status_code).to eq(200)
  end
end
