require 'spec_helper'
require 'timecop'

feature 'Post a peep' do
  scenario 'I can create a new peep' do
    t = Timecop.freeze(Time.new)
    user = create(:user)
    write_peep(user, 'Hello world!')
    expect(current_path).to eq('/peeps')
    within 'div#peeps' do
      expect(page).to have_content('Hello world!')
      expect(page).to have_content('Rebecca')
      expect(page).to have_content('katylouise')
      expect(page).to have_content("Written on: #{t.day}-#{t.month}-#{t.year} at #{t.hour}:#{t.min}")
    end
  end

  scenario 'I can post multiple peeps' do
    user = create(:user)
    write_peep(user, 'Hi there!')
    write_peep(user, "Howdy!")
    within 'div#peeps' do
      expect(page).to have_content('Hi there!')
      expect(page).to have_content('Howdy!')
    end
  end

  scenario 'You must be signed in to peep' do
    visit '/peeps'
    click_button 'Peep!'
    expect(page).to have_content('You need to be signed in to peep!')
  end
end
