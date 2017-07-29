feature 'able to see peep time' do
  before do
    Timecop.freeze(Time.local(2017, 07, 26, 00, 00, 00))
  end

  scenario 'logged in' do
    visit('/main')
    add_peep('this is my first peep')
    expect(page).to have_content('peeped at 00:00')
  end
end
