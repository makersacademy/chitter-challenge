feature 'Viewing peeps' do
  scenario 'I can see existing peeps' do
    Peep.create(message: 'Test Peep', time: Time.now)
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Test Peep')
    end
  end
end
