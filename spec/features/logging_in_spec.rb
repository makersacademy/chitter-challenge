require 'spec_helper'
require './app/models/user.rb'
require 'web_helper'

RSpec.feature 'User log in' do

    scenario 'with correct credentials' do
      sign_up
      sign_in
      expect(page).to have_content "Welcome Agatina!"
    end

  end
