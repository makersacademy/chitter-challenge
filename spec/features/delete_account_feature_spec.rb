require_relative 'web_helpers'

RSpec.feature 'Delete account' do
  context 'Chosing whether to delete account or not' do
    scenario 'A user choses not to delete account' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      sign_in
      click_link 'Delete Warble Account'
      click_button "I'm not done Warbeling, don't delete me!"
      expect(page.current_path).to eq "/private_profile/#{user.id}"
    end

    scenario 'A user confirms choice to delete account' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      sign_in
      click_link 'Delete Warble Account'
      click_button "I'm done Warbeling, delete me!"
      sign_in # same details
      expect(page.current_path).to eq '/'
    end
  end

end
