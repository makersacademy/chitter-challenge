require 'web_helper'

feature 'Chitter feed' do
  let(:message_body) { 'We had two bags of grass, seventy-five pellets of mescaline, five sheets of high powered blotter acid, a salt shaker half full of cocaine, and a whole galaxy of multi-colored uppers, downers, screamers, laughers... and also a quart of tequila, a quart of rum, a case of Budweiser, a pint of raw ether and two dozen amyls. Not that we needed all that for the trip, but once you get locked into a serious drug collection, the tendency is to push it as far as you can.' }

  scenario 'Post a message' do
    sign_up
    # visit '/feed'
    fill_in 'message', with: message_body
    click_button 'Send'
    within 'ul#peeps' do
      expect(page).to have_content(message_body)
    end
  end
end
