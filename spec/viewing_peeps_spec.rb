# User story 2,
# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'I can see existing links on the links page' do
    Peep.create(peep: 'Makers Academy Rocks', user: 'George')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Makers Academy Rocks')
    end
  end
end
