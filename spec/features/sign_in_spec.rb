require 'spec_helper'

feature 'signing in' do

  scenario 'sign in possible' do
    sign_up(true)
    sign_out
    sign_in
    expect(page).to have_content 'Welcome, Rufus Raghunath!'
    expect(page).to have_button 'Peep!'
    expect(page).to have_button 'Sign out'
  end

end
