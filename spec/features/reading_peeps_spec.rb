require 'pg'

feature 'Reading peeps' do
  scenario 'visit homepage and see all my peeps' do
    Peep.post(peep: 'Hello world, this is my first peep')
    Peep.post(peep: 'I am going to let people know what I am doing')
    Peep.post(peep: 'Every little thing')
    
    visit('/')
    expect(page).to have_content('Hello world, this is my first peep')
    expect(page).to have_content('I am going to let people know what I am doing')
    expect(page).to have_content('Every little thing')
  end
end
