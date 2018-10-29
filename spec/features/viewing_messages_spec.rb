feature 'Feature - Viewing messages' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'a user can see messages' do
    # Add the test data
    Message.create(message: 'This is my first peep', name: "Joe Bloggs")
    Message.create(message: 'This is my second peep', name: "Joe Bloggs")
    visit('./messages')

    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "This is my second peep"
    expect(page).to have_content "Joe Bloggs"
  end

  scenario 'a user can see the time the message was added' do
    Message.create(message: 'This is my first peep', name: "Joe Bloggs")
    visit('/messages')
    time_now = Time.new.strftime("%H:%M")

    expect(page).to have_content(time_now)
  end
end
