# frozen_string_literal: true
# require './app.rb'

feature 'adding messages' do

  before(:each) do
    @example_time = Time.new
    @formatted_time = @example_time.strftime("%k:%M")
    allow(Time).to receive(:new) {@example_time}
  end

  scenario 'user creates a new message which is displayed' do

    visit('/')
    sign_up_bob
    click_on 'to your messages...'
    create_message('hello chitter')

    expect(current_path).to eq('/messages')
    expect(page).to have_content('hello chitter')
    expect(page).to have_content(@formatted_time)
    expect(page).to have_content('Bob')
    expect(page).to have_content('smallbadger')

    create_message('its me the user')
    expect(page).to have_content('its me the user')

  end
end
