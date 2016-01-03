feature 'Viewing Peeps' do
  before(:each) do
    user = create_test_user
    create_test_peep(peep: 'first peep', user: user, time: Time.gm(2016, 1, 3, 12, 10, 10))
    create_test_peep(peep: 'second peep', user: user)
  end

  scenario 'peeps should be visible at /peeps in reverse chronological order' do
    visit '/peeps'
    expect(page).to have_css('ul#peeps li:first-child', text: 'second peep')
    expect(page).to have_css('ul#peeps li:last-child', text: 'first peep')
  end

  scenario 'peeps should display the time created on them' do
    visit '/peeps'
    within('ul#peeps li:last-child') do
      expect(page).to have_content 'on Sun at 12:10'
    end
  end
end
