require 'spec_helper'

feature 'Peeps can be posted' do
  scenario 'A user posting a peep' do
    sign_up
    peep
    expect(page).to have_content("jamesman peeped: Hello")
  end

  scenario 'A user can see the time of a peep' do
    sign_up
    peep
    expect(page).to have_content("jamesman peeped: Hello! at #{Time.now.strftime("%H:%M")}")
  end
end
