require_relative 'web_helpers'

RSpec.feature 'Chirrup' do
  context 'Posting a chirrup' do
    scenario 'A user signs in and posts a chirrup' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      sign_in
      click_button 'View Chirrups'
      post_chirrup
      expect(page.current_path).to eq('/chirrup-board')
      expect(page).to have_content 'Sqwark!'
    end

    scenario 'A user posts multiple messages and views them in reverse chronological order' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      message = create_message('Sqwark_1!')
      message = create_message('Sqwark_2!')
      sign_in
      click_button 'View Chirrups'
      click_button 'Post'
      expect('Sqwark_2').to appear_before('Sqwark_1')
    end

    scenario 'A user can see the time a Chirrup was posted' do
      user = create_user('christos', 'christos@makers.com', 'ClassicWoW')
      message = create_message('Sqwark!')
      sign_in
      click_button 'View Chirrup'
      expect(page).to have_content(message.created_at)
    end
  end
end
