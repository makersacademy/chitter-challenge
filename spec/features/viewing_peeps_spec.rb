feature 'Viewing Peeps:' do
  scenario 'should show the chitter feed' do
    connection = PG.connect(dbname: 'chitter_test')
    peep = Peep.create(name: 'Jane', message: 'This is a test peep!')
    visit ('/chitter')
    expect(page).to have_content 'This is a test peep!'
  end
end
