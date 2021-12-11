require 'spec_helper'

feature 'creating messages' do
  scenario 'can add a message and see it on the page' do
    visit('/messages')
    fill_in('text', with: 'Hello World!')
    click_button('Submit')
    expect(page).to have_content 'Hello World!'
  end

  context 'when logged in' do
    scenario 'displays author' do
      sign_up
      log_in
      fill_in('text', with: 'Hello World!')
      click_button('Submit')
      expect(first('#author').text).to eq 'Posted by Sherwin'
    end
  end
end
