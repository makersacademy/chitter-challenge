feature 'peeps' do
  before(:each) do
    Timecop.freeze(Time.local(2018))
  end

  after(:each) do
    Timecop.return
  end

  scenario 'added peeps are displayed with a message and time' do
    visit '/'
    click_button 'peeps'
    click_button 'Add peep'
    fill_in 'content', with: 'I ate a sandwich.'
    click_button 'Submit'
    expect(page).to have_content('I ate a sandwich.')
    expect(page).to have_content('01/01/2018 00:00')
  end

end
