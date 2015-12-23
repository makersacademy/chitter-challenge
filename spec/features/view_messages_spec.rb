feature 'View messages' do
  before do
    sign_up
    log_in
  end

  after do
    Timecop.return
  end

  scenario 'when logged in' do
    visit('/peeps')
    expect(page).to have_content('Latest peeps')
  end

  scenario 'when logged out' do
    click_button('Log out')
    visit '/peeps'
    expect(page).to have_content('Latest peeps')
  end

  # As a maker
  # So that I can see what others are saying
  # I want to see all peeps in reverse chronological order

  xscenario 'reverse chronological order' do

  end

  # As a maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario 'with the time they were posted' do
    visit '/peeps'
    time_stamp = Timecop.freeze(Time.now)
    post_message
    expect(page).to have_content(time_stamp.strftime("%F %T"))
  end
end
