require_relative '../spec_helper'

feature 'Posting Peeps' do
  scenario 'can see peep I\'ve just posted' do
    visit '/'
    click_button 'Peep here'

    expect(current_path).to eq '/enter_peep'

    fill_in :username, with: 'hulbgoblin'
    fill_in :peep, with: 'Bleugh'
    click_button 'Post peep'

    peeps = ChitterFeed.all

    expect(current_path).to eq '/'
    expect(page).to have_content "hulbgoblin"
    expect(page).to have_content "Bleugh"
  end
end
