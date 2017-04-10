xfeature 'Reverse order' do
  before (:each) do
    Peep.create(peep: 'This is my first peep', created_at: '12:00 on 01/04/17')
    Peep.create(peep: 'This is my second peep', created_at: '15:00 on 05/04/17')
    Peep.create(peep: 'This is my third peep', created_at: '20:00 on 10/05/17')
  end

  scenario 'List peeps in reverse order' do
    visit '/peeps'
    click_button 'List in reverse order'
    expect(page).to have_content ''
  end
end
