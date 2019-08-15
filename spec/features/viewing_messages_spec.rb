feature 'viewing messages' do
  scenario 'visiting the index page' do

    visit('/')

    expect(page).to have_content "Hello Chitter"
  end

  scenario 'a user can see messages' do
    Chat.create(text:'Hello', created_at: '2019-08-15 20:32:39 +0100')
    Chat.create(text:'How are you?', created_at: '2019-08-15 20:32:39 +0100')
    Chat.create(text:'Ruby is fantastic!', created_at: '2019-08-15 20:32:39 +0100')

    visit('/messages')

    expect(page).to have_content "Hello"
    expect(page).to have_content "How are you?"
    expect(page).to have_content "Ruby is fantastic!"
  end
end