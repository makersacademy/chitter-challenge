feature 'peeps' do
  before(:each) do
    Timecop.freeze(Time.local(2018))
  end

  after(:each) do
    Timecop.return
  end

  scenario 'peeps are displayed with a message and time' do
    add_peep('I ate a sandwich.')
    expect(page).to have_content('I ate a sandwich.')
    expect(page).to have_content('01/01/2018 00:00')
  end

  scenario 'peeps are displayed in reverse chronological order' do
    add_peep('I ate a sandwich.')
    Timecop.freeze(Time.local(2019))
    add_peep('I ate some crisps.')
    expect('I ate some crisps.').to appear_before('I ate a sandwich.')
  end

end
