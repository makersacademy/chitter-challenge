require_relative 'web_helpers'

RSpec.feature 'Sign out' do
  context 'Existing user' do
    scenario 'Warbler can sign out' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      sign_in
      click_button 'Sign Out'
      expect(page.current_path).to eq('/')
    end
  end

end
