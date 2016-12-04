require 'spec_helper.rb'
require 'web_helpers.rb'

feature 'Sign Up' do

  scenario 'sign up to Chitter' do
    visit '/sign_up'
    sign_up
  end
end
