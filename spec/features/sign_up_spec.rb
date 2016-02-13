require 'spec_helper'

feature 'signing up' do

  scenario 'sign up possible' do

    visit '/'
    expect(page).to have_button 'Sign up'

  end


end
