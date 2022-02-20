require 'features/web_helper'

feature 'post a peep' do
  scenario 'post and then view a message on chitter' do
    post_first_peep
    visit '/peeps'
    expect(page).to have_content "My first peep"
  end
end
