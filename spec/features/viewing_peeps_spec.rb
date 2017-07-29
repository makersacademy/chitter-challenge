# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'Viewing peeps' do

  scenario 'I can see all peeps on the peeps page' do
    Peep.create(name: 'Dave', username: '@dodgydave', peep: 'Hello world!')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end
end
