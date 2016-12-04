require 'spec_helper'

RSpec.feature 'See peeps' do

  scenario "- everyone can see can see peeps" do
    peep_and_log_out
    expect(page).to have_content('Lorem ipsum dolor sit amet.')
  end

  scenario "- everyone can see when a peep was peeped" do
    peep_and_log_out
    expect(page).to have_content('Sent at')
  end

end
