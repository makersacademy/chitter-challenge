feature 'viewing messages' do
  scenario 'visiting the index page' do

    visit('/')

    expect(page).to have_content "Hello Chitter"
  end

  scenario 'a user can see messages' do
    Chat.create(text:'Hello')
    Chat.create(text:'How are you?')
    Chat.create(text:'Ruby is fantastic!')

    visit('/messages')

    expect(page).to have_content "Hello"
    expect(page).to have_content "How are you?"
    expect(page).to have_content "Ruby is fantastic!"
  end
end