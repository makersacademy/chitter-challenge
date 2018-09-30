require'timecop'

feature 'Adding a new message' do
  scenario 'A user can post a message to Chitter' do
    visit('/messages/new')
    fill_in('messages', with: 'test message')
    click_button('Submit')

    expect(page).to have_content 'test message'
  end

  # scenario 'new message appear on top ' do
  #   Timecop.freeze(Time.new(2018, 9, 24, 16, 0, 0, 0))
  #   visit('/messages/new')
  #   fill_in('messages', with: 'test_message')
  #   click_button('Submit')
  #   expect(page).to have_content("test_messgae")
  #   expect(page).to have_content("Posted at 24-09-18 16:00")
  # end
end
