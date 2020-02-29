feature 'viewing peeps' do
  scenario 'user visits app' do
    Peep.create(body: 'My first peep', time_posted: Time.now)
    visit '/peeps'
    expect(page).to have_content "My first peep" 
  end
end
