feature 'Feature - Viewing messages' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'a user can see messages' do
    # Add the test data
    Message.create(message: 'This is my first peep')
    Message.create(message: 'This is my second peep')
    visit('./messages')

    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "This is my second peep"
  end

  scenario 'a user can see the time the message was added' do
    Message.create(message: 'This is my first peep')
    visit('/messages')
    time_now = Time.new.strftime("%H:%M")

    expect(page).to have_content(time_now)
  end
end
