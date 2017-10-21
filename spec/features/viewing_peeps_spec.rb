# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'viewing peeps' do
  scenario 'I can see peeps in reverse chronological order' do
    Peep.create(pop: 'My first peep: Global Warming is a hoax!')

    visit '/peeps'

    expect(page.status_code).to eq 200

    within 'ul#peeps' do
    expect(page).to have_content "My first peep: Global Warming is a hoax!"
    end
  end
end
