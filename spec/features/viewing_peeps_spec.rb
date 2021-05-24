# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'viewing messages' do
  scenario 'a user can see messages' do
    Message.create("This is my first peep!", "Bob", "13:00 01/01/2021")
    Message.create("Second peep!", "Bob", "14:00 02/02/2021")
    Message.create("Third peep peeps!", "Bob", "15:00 03/03/2021")

    visit('/chitter')
    first_message = find('/html/body/ul/li[1]').text
    expect(first_message).to eq("15:00 03/03/2021 - Bob - Third peep peeps!")  
  end
  
end