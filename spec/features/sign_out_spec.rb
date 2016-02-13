require 'spec_helper'

feature 'signing out' do

  before {sign_up(true)}

  scenario 'sign out possible' do
    expect(page).to have_button 'Sign out'
  end

  scenario 'sign out redirects to index with goodbye msg' do
    sign_out
    expect(page).to have_content 'See ya, Rufus Raghunath'
    expect(page).to have_button 'Sign in'
    expect(page).to have_button 'Sign up'
  end

end
