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

  scenario 'I want to see peeps in reverse chronological order' do
    Peep.create(name: 'Dave', username: '@dodgydave', peep: 'I should be next')
    Peep.create(name: 'Fred', username: '@fruityfred', peep: 'I should be first')
    visit '/peeps'
    expect(page.find('li:nth-of-type(1)')).to have_content 'I should be first'
  end
end
