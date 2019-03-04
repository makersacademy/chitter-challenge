require 'spec_helper'
require 'web_helper'

feature 'comment a peep' do
  scenario 'a user can comment a peep' do
    sign_up
    post_a_peep

    click_button 'Add Comment'

     fill_in 'comment', with: 'this is a test comment on this peep'
     click_button 'Submit'

     expect(current_path).to eq '/peeps'
     expect(page).to have_content 'This is a test comment on this peep'
  end
end
