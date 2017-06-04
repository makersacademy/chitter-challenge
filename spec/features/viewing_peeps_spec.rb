# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature 'view timeline of peeps' do
  scenario 'see peeps in reverse chronological order' do
    visit('/peeps/new')
    fill_in('message', with: 'first')
    click_button('Peep now')
    visit('/peeps/new')
    fill_in('message', with: 'second')
    click_button('Peep now')
    visit('/peeps/new')
    fill_in('message', with: 'third')
    click_button('Peep now')
    first_peep = Peep.first
    expect(first_peep.message).to eq 'first'
  end
end
