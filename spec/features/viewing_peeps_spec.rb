feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the news_feed page' do
    Peep.create(username: 'DaveTheRave', content: 'peep test')
    visit '/peeps/index'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('peep test')
    end
  end
end
