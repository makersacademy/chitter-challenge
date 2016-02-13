require 'spec_helper'

feature 'signing up' do

  scenario 'sign up possible' do
    expect{sign_up(true)}.to change{User.count}.by 1
  end

  scenario 'sign up not possible when passwords don\'t match' do
    expect{sign_up(false)}.not_to change{User.count}
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'prevents duplicate sign up' do
    sign_up(true)
    sign_out
    expect{sign_up(true)}.not_to change{User.count}
  end

  scenario 'sign up takes user to peep page and lets them contribute' do
    sign_up(true)
    expect(page).to have_content 'Welcome, Rufus Raghunath!'
    expect(page).to have_button 'Peep!'
  end


end
