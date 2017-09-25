feature 'See a list of peeps' do
  scenario ' See all peeps in reverse chronological order' do
    Peep.create(message: 'Hello')
    Peep.create(message: 'There')
    visit '/list'
    expect('There').to appear_before 'Hello'
  end
end
