#As a maker
#So that I can see what others are saying
#I want to see all peeps in reverse chronological order

feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the homepage' do
    Peep.create(text: 'hello', time: Time.now)
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('hello')
  end
end
