require 'spec_helper'

feature 'signing out' do

  before {sign_up(true)}

  scenario 'sign out possible' do
    expect(page).to have_css '#sign_out'
  end

  scenario 'sign out redirects to index with goodbye msg' do
    sign_out
    expect(page).to have_content 'See ya, Rufus Raghunath'
    expect(page).to have_css '#sign_in'
    expect(page).to have_css '#sign_up'
  end

end
