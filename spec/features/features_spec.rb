require './app.rb'
require 'spec_helper'
require 'pg'

feature 'homepage contains a form and button' do
  scenario 'has test field and button' do
    visit('/')
    expect(page).to have_field('enter_chitter')
    expect(page).to have_button('Chit')
  end
end
