feature 'Viewing Peeps' do
  scenario 'user can see all peeps' do
    Peep.create(name: 'John Smith', handle: 'js2019', message: 'This is a test peep', timestamp: '14/10/2019 10:30')
    Peep.create(name: 'John Smith', handle: 'js2019', message: 'This is a test peep 2' timestamp: '14/10/2019 10:30')

    visit '/peeps'

    expect(page).to have_content ('This is a test peep')
    expect(page).to have_content ('This is a test peep 2')
  end
end
