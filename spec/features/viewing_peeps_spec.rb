feature 'viewing messages' do
  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario 'a user can see the time a message was created' do
    Message.create("This is my first peep!", "Bob", "13:00 01/01/2021")

    visit('/chitter')
    expect(page).to have_content("13:00 01/01/2021 - Bob - This is my first peep!")  
  end
  
  # As a Maker
  # So that I can see what others are saying  
  # I want to see all peeps in reverse chronological order

  scenario 'messages are displayed in reverse chronological order' do
    Message.create("This is my first peep!", "Bob", "13:00 01/01/2021")
    Message.create("Second peep!", "Bob", "14:00 02/02/2021")
    Message.create("Third peep peeps!", "Bob", "15:00 03/03/2021")

    visit('/chitter')
    save_and_open_page
    first_message = find('/html/body/ul/li[1]').text
    expect(first_message).to eq("15:00 03/03/2021 - Bob - Third peep peeps!")  
  end
end