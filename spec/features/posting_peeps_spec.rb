require 'time'

feature 'posting peeps' do

  # let(:time) {double(:time)}

  scenario 'can see the peep on the home page' do
    sign_up_good
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    expect(page).to have_content 'Hello this is my peep'
  end

  scenario 'cannot be done when not logged in' do
    visit '/'
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    expect(page).to have_content 'You need to login to peep'
  end

  # scenario 'peeps are shown in reverse cronilogical order' do
  #   sign_up_good
  #   fill_in 'peep_input', with: 'Hello this is my peep'
  #   click_button 'Peep'
  #   fill_in 'peep_input', with: 'this is the second peep'
  #   click_button 'Peep'
  #   time = Time.new
  #   expect(page).to have_content 'this is the second peep SidTheSloth '+time.strftime("%H:%M %-d %b %Y")+' Hello this is my peep SidTheSloth'
  # end

  scenario 'will show the user name of the person who made the peep' do
    sign_up_good
    fill_in 'peep_input', with: 'Hello this is my peep'
    click_button 'Peep'
    expect(page).to have_content 'Hello this is my peep SidTheSloth'
  end

  # scenario 'there is the time that a peep was posted' do
  #   # allow(time).to receive(:strftime).and_return('14:20 14 Feb 2016')
  #   sign_up_good
  #   fill_in 'peep_input', with: 'Hello this is my peep'
  #   click_button 'Peep'
  #   time = Time.new
  #   expect(page).to have_content time.strftime("%H:%M %-d %b %Y")
  # end

end
