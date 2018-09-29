
feature 'Viewing messages' do
  scenario 'A user can see all the messages' do
    visit('/messages')

    expect(page).to have_content "Welcome to Chitter"
  end
end
