require './app.rb'
require 'spec_helper'

feature 'Chitter homepage' do
  scenario 'homepage has a chitter header' do
    visit '/'
    expect(page).to have_content "Chitter"
  end
end
