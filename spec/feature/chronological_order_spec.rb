# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'chronological order' do
  scenario 'so that all prior peeps can be seen in chronological order' do
    visit('/peep/new')
    fill_in 'wording', with: 'first one'
    click_button 'submit'
    fill_in 'wording', with: 'second one'
    click_button 'submit'
    # first = Peep.create(wording: "first one")
    # second = Peep.create(wording: "second one")

    expect('second one').to appear_before('first one')
  end
end
