feature 'Features - Retrieve peeps' do
  before do
    user = User.create(username: 'test', name: 'rspec', password: '1234',
      email: 'test@email.com')
    visit('/login')
    fill_in :username, with: 'test'
    fill_in :password, with: '1234'
    click_button 'Submit'
    peep = Peep.create(peep: 'my first peep', user_id: user.id)
    Peep.create(peep: 'my second peep', user_id: user.id)
  end

  scenario 'user wants to see all peeps in reverse chronological order' do
    click_button 'See peeps'
    expect(page.body.index('my first peep')).to be > (page.body.index('my second peep'))
  end

  scenario 'user wants to see when a peep was sent' do
    visit('/all_peeps')
    peep = Peep.create(peep: 'my first peep, hurray!')
    expect(peep.created_at).to be_within(2.seconds).of(Time.now)
  end
end
