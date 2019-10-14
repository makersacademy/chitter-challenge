feature 'Viewing Peeps' do
  scenario 'user can see all peeps' do
    Peep.create(name: 'John Smith', handle: 'js2019', message: 'This is a test peep')
    Peep.create(name: 'John Smith', handle: 'js2019', message: 'This is a test peep 2')

    visit '/peeps'

    expect(page).to have_content 'This is a test peep'
    expect(page).to have_content 'This is a test peep 2' 
  end
end
