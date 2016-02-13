require 'spec_helper'

feature 'signing in' do

  scenario 'sign in possible' do

    visit '/'
    expect(page).to have_button 'Sign in'

  end


end
