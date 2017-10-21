#As a maker
#So that I can see what others are saying
# want to see all peeps in reverse chronological order

feature 'viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(name: 'Tim', username: 'timjones10', message: 'My first peep', time: Time.new.strftime("%I:%M%p"))
    visit '/peeps'

    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('My first peep')
    end
  end
end
