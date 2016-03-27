require 'web_helper'

feature 'User can peep' do
  include Helpers

  scenario ' when logged in' do
    sign_up
    sign_in
    fill_in('message', with: 'Test post')
    click_button('Peep')
    within 'div#chitters' do
      expect(page).to have_content('Test post')
      expect(page).to have_content("ghost peeped")
    end
  end
  # context 'Cannot peep'
  #   scenario 'with no message' do
  #     sign_up
  #     log_in
  #     #fill_in('message', with: nil)
  #     expect{ click_button('Peep') }.not_to change(Post, :count)
  #   end
  #
  #   scenario 'if not logged in' do
  #     visit('/home')
  #     expect(page).not_to have_xpath('//div[@id = "post"]')
  #   end
  # end
end
