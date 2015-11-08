feature 'View peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create( message: 'This is my first peep', time_stamp: Time.now)
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('This is my first peep')
    end
  end
end