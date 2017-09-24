

feature 'When reading the peepline' do
  let(:peep1) { 'And those who are first will be last' }
  let(:peep2) { 'So those who are last now will be first' }
  let(:test_time_return) { ' on 2017-09-22 at 09:00)' }
  let(:test_time_return_plus_1hr) { ' on 2017-09-22 at 10:00)' }

  scenario 'Not signed up, visit home page called stranger' do
    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    default_peepline
    visit '/peeps'
    expect(page).to have_content('Welcome to the peepline, Stranger')
  end

  scenario 'I can see them in reverse chronological order' do
    # As a maker
    # So that I can see what others are saying
    # I want to see all peeps in reverse chronological order
    default_peepline
    visit '/peeps'
    expect(peep2).to appear_before(peep1)
  end

  scenario 'I can see them with time stamps' do
    # As a Maker
    # So that I can better appreciate the context of a peep
    # I want to see the time at which it was made
    new_time = Time.new(2017, 9, 22, 9, 0, 0)
    Timecop.freeze(new_time) do
      default_peepline
      visit '/peeps'
      expect(find_by_id('peeps-list')).to have_content(test_time_return)
    end
  end

  scenario 'The time stamp increments' do
    # As a Maker
    # So that I can better appreciate the context of a peep
    # I want to see the time at which it was made
    new_time = Time.new(2017, 9, 22, 9, 0, 0)
    Timecop.freeze(new_time)
    default_peepline
    visit '/peeps'
    expect(find_by_id('peeps-list')).to have_content(test_time_return)
    Timecop.travel(new_time + 3600)
    default_peepline
    visit '/peeps'
    expect(find_by_id('peeps-list')).to have_content(test_time_return_plus_1hr)
  end
end
