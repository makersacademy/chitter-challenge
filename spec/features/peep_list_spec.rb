feature 'see peep list in reverse chronological order' do
  before do
    Timecop.freeze(Time.local(2017, 07, 26, 00, 00, 00))
  end
  scenario 'logged in' do
    visit('/main')
    add_peep('this is my first peep')
    add_peep('this is my second peep')
    expect(page).to have_content('this is my second peep', 'this is my first peep')
  end
end
