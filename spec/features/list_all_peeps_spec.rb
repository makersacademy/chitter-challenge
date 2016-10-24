require 'spec_helper'

RSpec.feature 'see list of peeps' do

  scenario 'can see list of peeps anytime' do
    sign_up
    fill_in 'peep', with: "Let's all peep together now"
    click_button 'Peep'
    fill_in 'peep', with: "How about them Cowboys!!"
    click_button 'Peep'
    click_button 'Sign out'

    expect(page).to have_content('Cheers for using Chitter. Peace out.')
    expect(page).to have_content('User: j.smith90')
    expect(page).to have_content('Let\'s all peep together now')
    expect(page).to have_content('How about them Cowboys!!')
  end

end
