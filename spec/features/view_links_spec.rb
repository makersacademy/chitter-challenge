require 'spec_helper'

feature 'view cheeps' do
  scenario 'see list of cheeps on homepage' do
    visit('/')
    expect(page).to have_content('Please find the latest cheeps below')
  end
end
