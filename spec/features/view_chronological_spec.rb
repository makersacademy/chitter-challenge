require_relative '../helpers/add_users_peeps'
# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

feature 'peeps listed in reverse order (newest first' do
  scenario 'second peep appears before first' do

    create_users_peeps

    visit('/peeps')

    peep1 = 'This is my first peep'
    peep2 = 'This is a smug peep'

    expect(page.body.index(peep1)).to be > page.body.index(peep2)

  end
end