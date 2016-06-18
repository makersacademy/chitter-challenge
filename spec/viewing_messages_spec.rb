feature 'Viewing messages' do

  scenario 'I have a index page to selet optios' do
    visit '/'
    expect(page). to have_content 'Messages'
  end

  scenario 'I can see existing messages on the messages page' do
    Message.create(message: 'Hello Chitter!')
    visit '/messages'
    within 'ul#messages' do
      expect(page).to have_content 'Hello Chitter!'
    end
  end
end
