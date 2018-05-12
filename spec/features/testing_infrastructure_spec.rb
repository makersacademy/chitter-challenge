require './app.rb'
require 'spec_helper'

feature Chitter do
  scenario 'Testing infrastructure' do
    visit '/'
    expect(page).to have_content 'Testing infrastructure working'
  end
end
