require 'spec_helper'

feature 'User adds a new message' do
  scenario 'when browsing the homepage' do
    expect(Convo.count).to eq 0
    visit '/'
    add_message('Hello')
    expect(Convo.count).to eq 1
    convo = Convo.first
    # expect(convo.title).to eq('Greeting')
    expect(convo.message).to eq('Hello')
  end

  def add_message(message, tags = [])
    within('#new-message') do
      fill_in 'message', with: message
      fill_in 'tags', with: tags.join(' ')
      click_button 'Post Message'
    end
  end
  scenario 'adds tags to the message' do
    visit '/'
    add_message('Hello',
              ['greeting', 'friendly'])
    convo = Convo.first
    expect(convo.tags.map(&:text)).to include('greeting', 'friendly')
    expect(page).to have_content('greeting')
  end

  xscenario 'message displays time of post' do
    visit '/'
    add_convo('Hello')
  end

end