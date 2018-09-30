
feature 'Viewing messages' do
  scenario 'A user can see all the messages' do

    Messages.create(messages: "Welcome to Chitter")

    visit('/')

    expect(page).to have_content "Welcome to Chitter"
  end
end
