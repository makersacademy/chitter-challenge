require 'pg'

feature 'Viewing chitters' do
  scenario 'A user can see chitters' do
    Chitter.create(text: 'Hello everyone', message: 'Greeting')
    Chitter.create(text: 'Good to meet you', message: 'Appreciation')
    Chitter.create(text: 'Enjoy your day', message: 'Good Bye')

    visit '/chitters'

    expect(page).to have('Greeting', ref: 'Hello everyone')
    expect(page).to have('Appreciation',  ref: 'Good to meet you')
    expect(page).to have('Good Bye', ref: 'Enjoy your day')
    end
  end