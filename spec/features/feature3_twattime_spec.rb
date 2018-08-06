feature 'Time is dsplayed in message' do
  scenario 'When user sends message, time of sending is displayed' do
    login_to_twat
    fill_in('new_message', with: 'the date should be today')
    time = Time.now.strftime("%d/%m/%Y %H:%M")
    click_button('Send')
    expect(page).to have_content(time)
  end
end
