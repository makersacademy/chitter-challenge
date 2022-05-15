require 'pg'

feature 'viewing chitter' do
  scenario 'Visiting /messages show me all the peeps' do

    Chitter.create(peep: 'I love Chitter!')
    Chitter.create(peep: 'How do I peep?')
    Chitter.create(peep: 'This is so fun.')
    
    visit('/messages')

    expect(page).to have_content "This is so fun."
    expect(page).to have_content "How do I peep?"
    expect(page).to have_content "I love Chitter!"
    
  end

end
