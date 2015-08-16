feature 'viewing peeps on a page in order' do
  
  before(:each) do
    user = create :user
    sign_in(user)
    peep = build :peep
    post(peep)
  end

  scenario 'peeps are displayed' do
    expect(page).to have_content('The first peep')
  end

  scenario 'peeps display names' do
    expect(page).to have_content('Katya')
  end

  scenario 'peeps display usernames' do
    expect(page).to have_content('kvyas')
  end

  scenario 'peeps have time stamp' do
    expect(page).to have_content("Thu Jan 1 00:00:00 2015")
  end

end