
# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'posting peeps' do
  scenario 'an authenticated user can post peeps on chitter' do
    Peeps.create(peep: 'First peep')
    visit('/peeps')
    expect(page).to have_content('First peep')
  end
end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
feature 'seeing all peeps' do
  scenario 'a user can see all the peeps in reverse chronological order' do
    Peeps.create(peep: 'First peep')
    Peeps.create(peep: 'Second peep')
    Peeps.create(peep: 'Third peep')

    visit('/peeps')

    expect(page.text.index('Third peep')).to be < page.text.index('Second peep')
  end
end
