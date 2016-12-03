feature 'vieiwing tweets' do
  scenarion 'should be able to view tweets' do
    Tweets.create(Tweet: 'thomas edison: i have an idea [a fucked up rough draft of the lightbulb appears above his head]')
    visit '/tweets'
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('thomas edison')
    end
  end
end
