require 'spec_helper'
require 'timecop'

feature 'peeping' do

  Timecop.freeze do

    before do
      sign_up(true)
      generate_peep
    end

    scenario 'peeping posts messages to /peeps page' do
      expect(page).to have_content "My first peep!"
      expect(page).to have_content "Rufus Raghunath"
      expect(page).to have_content "rufusraghunath"
      expect(page).to have_content Time.now
    end

    scenario 'log in not required to see peeps' do
      sign_out
      expect(page).to have_content "My first peep!"
      expect(page).to have_content "Rufus Raghunath"
      expect(page).to have_content "rufusraghunath"
      expect(page).to have_content Time.now
    end

  end

end
