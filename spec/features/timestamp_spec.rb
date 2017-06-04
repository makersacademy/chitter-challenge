feature 'Timestamp' do
  scenario 'User can check what time a peep was posted' do
    visit '/posts/new'
    fill_in 'message', with: 'A first peep!'
    click_button 'Add Peep'
    expect(page).to have_content(Time.now.strftime("posted at %I:%M%p on %m/%d/%Y"))
  end

  scenario 'User can see what time a peep was posted with peeps in database' do
    Peep.create(message: "Today's message", timestamp: Time.now)
    Peep.create(message: "Yesterday's message", timestamp: (Time.now - 86_400))
    visit '/posts'
    expect(page).to have_content "Message: Today's message #{Time.now.strftime("posted at %I:%M%p on %m/%d/%Y")} Message: Yesterday's message #{(Time.now - 86_400).strftime("posted at %I:%M%p on %m/%d/%Y")}"
  end

end
