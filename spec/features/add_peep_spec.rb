require_relative '../../app.rb'
require 'pg'
require 'peep'
require './spec/features/login_helper'
require './spec/features/sign_up_helper'
require './spec/features/add_peep_helper'

feature 'Logged in users can add a Peep' do
  scenario 'A logged in user has the option to post a peep' do
    user_logs_in
    expect(page).to have_content "Peep here:"
  end

  scenario 'A peep is added to the peeps' do
    user_signs_up
    click_button('Return to Peeps')
    user_peeps
    expect(page).to have_content "I love glitter"
  end
end
