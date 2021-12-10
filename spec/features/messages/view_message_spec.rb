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
    expect(first('li').text).to eq 'Hello Universe!'
  end

  scenario 'displays time of creation' do
    Message.create(text: "Hello World!")
    visit '/messages'
    expect(page).to have_content "#{Time.new.localtime}"
  end
end