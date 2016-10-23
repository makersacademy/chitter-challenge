require 'spec_helper'

feature 'Writing a new peep' do
  scenario 'Submit a new peep to be displayed' do
    log_in_ready_to_peep
    expect(current_path).to eq '/peeps'

    click_button('New Peep')
    expect(current_path).to eq '/new_peep'

    fill_in :peep, with: "Test peep"
    click_button('Submit Peep')

    within 'ul#peeps' do
      expect(page).to have_content('Test peep')
    end
  end
end
