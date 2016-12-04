require 'spec_helper'

RSpec.feature 'See peeps' do

  scenario "- everyone can see can see peeps" do
    sign_up_and_peep('Lorem ipsum dolor sit amet.')
    click_button('Log out')
    expect(page).to have_content('Lorem ipsum dolor sit amet.')
  end

  scenario "- everyone can see when a peep was peeped" do
    sign_up_and_peep('Lorem ipsum dolor sit amet.')
    click_button('Log out')
    expect(page).to have_content('Sent at')
  end

end
