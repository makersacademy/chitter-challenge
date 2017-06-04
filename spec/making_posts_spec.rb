feature 'make peeps on Chitter' do
  scenario 'user can post messages' do
    Peep.create(content: 'Hello world!')
    visit('/posts')
    expect(page).to have_content 'Hello world!'
  end
end
