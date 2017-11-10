feature 'Adding message' do

  scenario 'I can add a message' do
    visit('/')
    sign_up
    click_button('Create message')
    fill_in('message_input', with: "I love Sinatra!")
    click_on('Go Chitter!')

    within('ul#peeps') do
      expect(page).to have_content('I love Sinatra!')
    end
  end

  scenario 'I can see the timestamp on the message ' do
    visit('/')
    sign_up
    click_button('Create message')
    fill_in('message_input', with: "I love Sinatra!")
    click_on('Go Chitter!')

    time = Time.now

    within('ul#peeps') do
      expect(page).to have_content("#{time.strftime("%d")} #{time.strftime("%B")} #{time.strftime("%Y")}")
      expect(page).to have_content("#{time.strftime("%H")}:#{time.strftime("%M")}")

    end
  end
end
