feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: 'first message', time: DateTime.now)
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#messages' do
      expect(page).to have_content('first message')
    end
  end
end