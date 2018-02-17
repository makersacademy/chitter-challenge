feature 'Ordered tweets reverse chronologically' do
  scenario 'on homepage, seeing cheets in order' do
    visit '/cheets'
    expect(page.body.index('My third DataMapper post')).to be < page.body.index('My first DataMapper post')
  end
end
