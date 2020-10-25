require 'pg'

feature 'Homepage' do
  scenario 'Welcomes the user with a title' do
    visit '/'
    expect(page).to have_content('Welcome to Chitter')
  end
end

feature 'In Viewing Peeps Page' do
  scenario 'A user can see the peeps' do
    Peeps.create(message_content: 'I had a great day')
    Peeps.create(message_content: 'I feel sad')
    visit ('/peeps')

    expect(page).to have_content "I had a great day"
    expect(page).to have_content "I feel sad"
  end
end

feature 'Adding a new Peep' do
  scenario 'A user can add a peep to Peep Manager' do
    visit('/peeps/new')
    fill_in('message_content', with: 'Playing football with the lads today')
    click_button('Submit')

    expect(page).to have_content 'Playing football with the lads today'
  end
end