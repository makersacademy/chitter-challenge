feature 'Viewing peeps' do
  
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(user: 'banana', content: 'My first peep', time:'04/07/2015 11:00am')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
    end
  end
  
end