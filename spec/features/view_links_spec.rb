require 'spec_helper'

feature 'view cheeps' do
  scenario 'see list of cheeps on homepage' do
    visit('/')
    expect(page).to have_content('Welcome. Please find the latest cheeps below')
    expect(page).to have_content("rich lewis likes to sleep with men")
  end
end
