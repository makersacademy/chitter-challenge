require 'spec_helper'

feature 'User Sign Out' do

  scenario 'There is a sign out option on Chitter\'s main messaging page' do
    sign_up_good
    click_button("Take Me To My Brethrin")
    expect(page).to have_content('Chitter HQ')
    expect(page).to have_content('Leave? Surely not... ')
    expect(page).to have_button("This is weird. You're all weird")
  end

  scenario 'Signing out returns you to homepage and clears session_user' do
    sign_up_good
    click_button("Take Me To My Brethrin")
    click_button("This is weird. You're all weird")
    expect(page).to have_content('Cultivating Banal Chit Chat since 2016')
    expect(page).to have_button('Secret Member\'s Handshake')
  end



end
