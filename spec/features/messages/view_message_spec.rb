require './lib/message'

feature 'viewing messages' do
  scenario 'on the page' do
    Message.create(text: "Hello World!")
    visit '/messages'
    expect(page).to have_content('Hello World!')
  end

  scenario 'can be viewed in reverse chronological order' do
    Message.create(text: "Hello World!")
    Message.create(text: "Hello Universe!")
    visit '/messages'
    click_button 'View by oldest'
    expect(first('#message').text).to eq 'Hello World!'
  end

  scenario 'displays time of creation' do
    Message.create(text: "Hello World!")
    visit '/messages'
    expect(page).to have_content Time.new.strftime("%H:%M %p %b' %d, %y").to_s
  end
end
