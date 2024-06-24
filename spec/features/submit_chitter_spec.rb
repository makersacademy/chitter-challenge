require 'pg'

feature 'submitting chitter' do
  scenario 'submit chitter through the browser' do
    visit('/chitters/new')
    fill_in('text', with: 'Hello everyone')
    fill_in('message', with: 'Greeting')
    click_button('Submit')

    expect(page).to have('Greeting', ref: 'Hello everyone')
  end
end