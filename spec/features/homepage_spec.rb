require 'spec_helper'

feature 'homepage' do
  scenario 'Start a peep with chitter' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
  end

end
