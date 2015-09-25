require 'spec_helper'

feature 'Creating peeps' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
    fill_in 'text',   with: 'This is a new peep'
    click_button 'Submit peep'

    # we expect to be redirected back to the links page
    expect(current_path).to eq '/peeps'

    within 'ul#peeps' do
      expect(page).to have_content('This is a new peep')
    end
  end
end