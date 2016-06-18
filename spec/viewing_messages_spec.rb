feature 'Viewing messages' do

  scenario 'I can see existing messages on the messages page' do
    Message.create(message: 'Hello Chitter!')
    visit '/messages'
    expect(page.status_code).to eq 200

    within 'ul#messages' do
      expect(page).to have_content('Hello Chitter')
    end
  end
end
