feature 'Peeps' do
  before(:each) do
    Timecop.freeze(Time.local(2018))
    sign_up('test@testing.com', 'secret_pass', 'secret_pass', 'Test Bloggs', 'testy')
  end

  after(:each) do
    Timecop.return
  end

  scenario 'displayed a message and time' do
    add_peep('I ate a sandwich.')
    expect(page).to have_content('I ate a sandwich.')
    expect(page).to have_content('01/01/2018 00:00')
  end

  scenario 'display a peeper\'s name and username' do
    add_peep('I ate some eggs.')
    expect(page).to have_content('peeped by user testy (Test Bloggs)')
  end

  scenario 'are displayed in reverse chronological order' do
    add_peep('I ate a sandwich.')
    Timecop.freeze(Time.local(2019))
    add_peep('I ate some crisps.')
    expect('I ate some crisps.').to appear_before('I ate a sandwich.')
  end

end
