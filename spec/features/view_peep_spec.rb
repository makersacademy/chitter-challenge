feature 'Welcome page' do
  scenario 'User enters page and has button for adding tweet' do
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create(peep: 'It is saturday!')
    visit('/chitterapp')
    expect(page).to have_content 'It is saturday!'
  end
end 



