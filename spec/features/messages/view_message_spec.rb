require './lib/message'

feature 'viewing messages' do
  scenario 'on the page' do
    Message.create(text: "Hello World!")
    visit '/messages'
    expect(page).to have_content('Hello World!')
  end
end