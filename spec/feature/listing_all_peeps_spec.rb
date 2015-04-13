feature 'listing all peeps' do

  before(:each) do
    Peep.create(body: 'Woo, another Twitter clone!', created_at: '2015-04-12 19:03:00' )
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Woo, another Twitter clone!')
    expect(page).to have_content('12/04/15 19:03')
  end
end