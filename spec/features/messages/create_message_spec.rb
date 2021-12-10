require 'spec_helper'

feature 'creating messages' do
  scenario 'can add a message and see it on the page' do
    visit('/messages')
    fill_in('text', with: 'Hello World!')
    click_button('Submit')
    expect(page).to have_content 'Hello World!'
  end

  context 'logged in' do
    scenario 'message has author' do
      log_in
      fill_in('text', with: 'Hello World!')
      click_button('Submit')
      expect(first('#author').text).to eq 'Sherwin'
    end
  end
end