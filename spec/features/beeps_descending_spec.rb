require 'database_wiper'
feature 'Descending Beeps' do
  before(:each) do
    database_wiper
    visit('/')
    fill_in 'beep', with: 'Here is the REAL body of my beeep'
    click_on('beep-boop')
    fill_in 'beep', with: 'Here is the body of my beep'
    click_on('beep-boop')
  end
  scenario 'Most recent beeps are displayed at the top' do
    expect('Here is the body of my beep').to appear_before('Here is the REAL body of my beeep')
  end
end
