feature 'Viewing peeps' do

  scenario 'I can see exisiting peeps on the timeline page' do
    Peep.create(peeps: 'This is a test', time: 'Thu Jan 1 00:00:00 2015')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('This is a test', 'Thu Jan 1 00:00:00 2015')
    end
  end
end
