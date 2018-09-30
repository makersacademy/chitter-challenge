feature 'view peeps' do
  scenario 'content of past peeps displayed on /peeps' do
    visit '/peeps'
    expect(page).to have_content('Happy new year.')
    expect(page).to have_content('Merry Christmas.')
    expect(page).to have_content('Trump was inagurated 2 years ago. Sad.')
  end
  scenario 'time of past peeps displayed on /peeps' do
    visit '/peeps'
    expect(page).to have_content('2018-01-01 00:00')
    expect(page).to have_content('2017-12-25 10:00')
    expect(page).to have_content('2018-01-13 11:23')
  end
  scenario 'shows name of peeper' do
    visit '/peeps'
    expect(page).to have_content('test@email.com')
  end
end
