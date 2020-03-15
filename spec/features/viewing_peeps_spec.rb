feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter"
  end

  scenario 'user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.create(text: 'I woke up today')
    Peep.create(text: 'I had breakfast')
    Peep.create(text: 'Then went to Makers')

    visit('/peeps')
    expect(page).to have_content 'I woke up today'
    expect(page).to have_content 'I had breakfast'
    expect(page).to have_content 'Then went to Makers'
  end
end
