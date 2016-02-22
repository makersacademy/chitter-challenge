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
      expect(page).to have_content Time.now.strftime("at %l:%M%P, %B %-d, %Y")
    end

    scenario 'log in not required to see peeps' do
      sign_out
      expect(page).to have_content "My first peep!"
      expect(page).to have_content "Rufus Raghunath"
      expect(page).to have_content "rufusraghunath"
      expect(page).to have_content Time.now.strftime("at %l:%M%P, %B %-d, %Y")
    end

  end

  scenario 'peeps are listed in reverse chronological order' do
    2.times {generate_peep}
    fill_in 'message', with: 'I should be at the top'
    click_button 'Peep!'
    expect('I should be at the top').to appear_before 'My first peep!'
  end

  scenario 'peeps are limited to 140 chars' do
  end

end
