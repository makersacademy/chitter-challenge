require 'spec_helper'

feature 'visiting the homepage' do
  scenario 'the page title is visible' do
    visit '/'
    expect(page).to have_content "Chitter"
  end
end
