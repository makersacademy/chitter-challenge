require 'pg'

feature 'viewing peeps' do
  scenario 'user can see peeps' do
    Peep.create(content: "First Peep!", username: 'Deanna')
    Peep.create(content: "Second Peep!", username: 'Madison')

    visit('/peeps')

    expect(page).to have_content 'First Peep!'
    expect(page).to have_content 'Deanna'
    expect(page).to have_content 'Second Peep!'
  end
end
