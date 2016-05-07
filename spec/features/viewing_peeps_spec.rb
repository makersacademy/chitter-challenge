feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(body: 'First peep, ek!', time_posted: Time.now)
    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('First peep, ek!')
    end

  end

end
