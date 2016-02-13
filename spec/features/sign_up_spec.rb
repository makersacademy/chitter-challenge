require 'spec_helper'

feature 'signing up' do

  scenario 'sign up possible' do
    expect{sign_up}.to change{User.count}.by 1
  end

  xscenario 'sign up takes user to peep page and lets them contribute' do
    sign_up
    expect(page).to have_content 'Welcome, Rufus'
    expect(page).to have_button 'Peep!'
  end


end
