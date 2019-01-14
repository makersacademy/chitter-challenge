require_relative 'web_helpers'

RSpec.feature 'Chirrup' do
  context 'Posting a chirrup' do
    scenario 'A user signs in and posts a chirrup' do
      user = create_user('christos', 'christos@makers.com', 'Makers123')
      sign_in
      click_button 'View Chirrups'
      post_chirrup
      expect(page.current_path).to eq('/chirrup-board')
      expect(page).to have_content('Sqwark!')
    end
  end

  context 'Viewing chirrups' do
    scenario 'Chirrups displayed in reverse chronological order on index and chirrup board' do
      user = create_user('christos', 'christos@makers.com', 'Makers123')
      message = create_message('Sqwark_1!')
      message = create_message('Sqwark_2!')
      visit '/'
      expect('Sqwark_2').to appear_before('Sqwark_1')
      sign_in
      click_button 'View Chirrups'
      expect('Sqwark_2').to appear_before('Sqwark_1')
    end

    scenario 'A user can see the time a Chirrup was posted' do
      user = create_user('christos', 'christos@makers.com', 'Makers123')
      message = create_message('Sqwark!')
      sign_in
      click_button 'View Chirrups'
      expect(page).to have_content(message.created_at)
    end
  end

end
