feature 'see the times peeps were posted' do
  scenario 'when visiting the peeps list, peeps should show the time they were posted' do
    maker = Maker.create('Su', 'Fox', 'there@here.com', '1234')
    first_peep_time = Time.new(2020, 12, 26, 12, 30, 3)
    Peep.create('My first peep', first_peep_time, maker.id)
    visit '/peeps'

    expect(page).to have_content 'Time - 2020-12-26 12:30:03'
  end
end
