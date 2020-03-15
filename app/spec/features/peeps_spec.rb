require 'spec_helper'
require_relative '../helpers'

feature 'peeps' do

  scenario 'should list all peeps' do
  create_peep
  expect(page).to have_content("this is a test peep")
  end

  scenario 'should create peep' do
    create_peep
    expect(page).to have_content("this is a test peep")
  end

end
