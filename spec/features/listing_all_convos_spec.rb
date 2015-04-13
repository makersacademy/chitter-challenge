require 'spec_helper'

feature 'User browses the list of links' do

  before(:each) do
    Convo.create(message: 'Hello',
                 tags: [Tag.first_or_create(text: 'greeting')])
    Convo.create(message: 'Hi',
                 tags: [Tag.first_or_create(text: 'greeting')])
    Convo.create(message: 'Goodbye',
                 tags: [Tag.first_or_create(text: 'farewell')])
    Convo.create(message: 'Bye',
                 tags: [Tag.first_or_create(text: 'farewell')])

  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content 'Hello'
  end
  scenario 'filtering by tag' do
    visit '/tags/greeting'
    expect(page).to have_content('Hello')
    expect(page).to have_content('Hi')
    expect(page).not_to have_content('Goodbye')
    expect(page).not_to have_content('Bye')
  end

end