require 'spec_helper'

feature 'Peep' do
  scenario 'post a peep to chitter' do
  visit ('/') 

  expect(page).to have_content 'My first peep'
  end
end