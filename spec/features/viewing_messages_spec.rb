feature 'Viewing messages' do

  scenario 'I can see existing messages on the messages page' do
    Message.create( peep: 'Hello world!',
                    name: 'Joe Giant',
                    username: 'jollygreengiant')

    visit '/messages'

    within 'ul#messages' do
      expect(page).to have_content('Hello world!')
    end
  end
end
