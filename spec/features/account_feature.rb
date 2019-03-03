require './app.rb'
require 'spec_helper'
require 'web_helper'

feature 'Can view my account' do
  scenario 'can log in and view my account' do
    login_steps
    expect(page).to have_content('Welcome Maria')
  end
end
