require_relative 'web_helpers'

RSpec.feature 'Chirrup' do
  context 'Posting a chirrup' do
    scenario 'A user signs in and posts a chirrup' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      sign_in
      click_button 'View Chirrups'
      fill_in :chirrup, with: 'Test chirrup'
      click_button 'Submit'
      expect(page.current_path).to eq ('/chirrup-board')
      expect(page).to have_content 'Test chirrup'
    end
  end

end
