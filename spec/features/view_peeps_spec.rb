# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'View all peeps in reverse chronological order' do
  scenario 'Post two peeps and last one appears first' do
    # first peep
    visit '/message/new'
    fill_in('peep', with: 'My first peep!')
    click_button('Submit')

    # second peep
    # click_button('Compose Peep')
    visit '/message/new'
    fill_in('peep', with: 'My second peep!')
    click_button('Submit')

    page.body.index('My first peep!').should > page.body.index('My second peep!')
    # how do i replace should syntax?
  end
end
