require 'spec_helper'

feature 'Comment on peeps' do

  scenario 'ability to post a comment' do
    user = create(:user)
    sign_in(user)
    click_button 'New peep'
    fill_in 'content',   with: 'First peep'
    click_button 'Peep!'
    click_button 'Reply'
    fill_in 'reply',   with: 'First reply'
    click_button 'Reply'
    expect(page).to have_content 'First reply'
  end
end
