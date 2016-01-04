feature 'View Peeps' do

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order

  before(:each) do
    sign_up
    user = create_user
    create_peep(peep: 'my first peep', user: user, time: Time.gm(1988, 9, 4, 01, 30, 00))
    create_peep(peep: 'my second peep', user: user, time: Time.now)
  end
  scenario 'peeps show the time at which they were sent' do
    visit '/peeps'
    expect(page).to have_content 'at 1988-09-04T01:30:00+01:00'
  end

  scenario 'Able to see a list of all peeps' do
    visit '/peeps'
    expect(page).to have_content('my second peep')
    expect(page).to have_content('my first peep')
  end
end
