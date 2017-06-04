feature 'personal feed of user' do
  scenario 'user sees all posts in reverse chronological order' do
    Peep.create(content: 'Hello')
    Peep.create(content: 'What up')
  end
end
