require 'web_helper'

feature 'User can peep' do
  include Helpers

  before do
    sign_up
    sign_in
    fill_in('message', with: 'Winter is comming!')
  end

  scenario ' when logged in' do
    expect{ click_button('Peep') }.to change(Peep, :count).by(1)
    within 'article#peeps' do
      expect(page).to have_content('Winter is comming!')
      expect(page).to have_content("ghost peeped")
    end
  end
  # context 'Cannot peep' do
  #   scenario 'with no message' do
  #     sign_up
  #     sign_in
  #     #fill_in('message', with: nil)
  #     expect{ click_button('Peep') }.not_to change(Peep, :count)
  #   end
  #
  #   # scenario 'if not logged in' do
  #   #   visit('/home')
  #   #   expect(page).not_to have_xpath('//div[@id = "new-message"]')
  #   # end
  # end
end
