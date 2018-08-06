feature 'Messages are displayed in correct order' do
  before(:each) { add_twats_to_db }
  scenario 'A new message appears above old messages' do
    visit('/')
    login_to_twat
    fill_in('new_message', with: 'this should be at the top')
    click_button('Send')
    within('div#messages') do 
      expect(page.text).to match(/this should be at the top\n\r\n\r\n\r\n29\/06\/1993 14:40\n\r\nAs a Maker/)
    end
  end
end
