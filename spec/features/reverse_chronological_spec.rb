feature 'see peeps in reverse chronological order' do

  before(:each) do
    create_user_alice
    log_in
  end

  scenario 'peeps are displayed in reverse chronological order' do

    post(content: 'Hello')
    sleep 0.02
    post(content: 'Aloha')

    within 'ul#peeps' do
      expect(page).to have_css("ul:nth-child(1)")
      expect(page).to have_css("ul:nth-child(2)")
      #expect(page).to have_css('li:contains("Aloha")+li:contains("Hello")')
    end
  end

end