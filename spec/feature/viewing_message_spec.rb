require 'pg'

feature 'Viewing Messages' do
  scenario 'A user can see messages' do
    Message.create(message: 'Hello')
    Message.create(message: 'Chitter Challenge!')
    Message.create(message: 'Programming in Ruby')

    visit '/messages'

    expect(page).to have_content('Hello')
    expect(page).to have_content('Chitter Challenge!')
    expect(page).to have_content('Programming in Ruby')
  end
end