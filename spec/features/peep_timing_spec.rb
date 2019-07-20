# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

feature 'Peep Timing:' do
  scenario 'shows a time associated with each peep' do
    Timecop.freeze(Time.now)
    post_peep('This is a time-testing peep')
    expect(current_path).to eq '/view_peeps'
    expect(page).to have_content(Time.now)
    expect(page.status_code).to eq(200)
  end
end
