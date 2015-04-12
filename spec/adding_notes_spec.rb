require 'spec_helper'

feature 'user adds a note to fridgedoor' do

  before do
    sign_up
  end

  scenario 'adds a note' do
    visit '/'
    expect(Note.count).to eq 0
    fill_in 'note', with: 'Test note'
    click_button 'Post'
    expect(Note.count).to eq 1
    expect(page).to have_content('Test note')
  end

end