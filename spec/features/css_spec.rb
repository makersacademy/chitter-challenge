require 'spec_helper'

feature 'Has a SCSS file' do
  scenario 'can load a SCSS file' do
    visit('/css/style.css')
    expect(page).to have_content('body')
  end
end
