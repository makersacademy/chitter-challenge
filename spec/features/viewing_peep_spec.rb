feature 'Viewing Peeps' do
  before(:each) do
    sign_up
    send_peep(peep: 'first peep')
    send_peep(peep: 'second peep')
  end

  scenario 'peeps should be visible at /peeps in reverse chronological order' do
    visit '/peeps'
    expect(page).to have_css('ul#peeps li:first-child', text: 'second peep')
    expect(page).to have_css('ul#peeps li:last-child', text: 'first peep')
  end
end
