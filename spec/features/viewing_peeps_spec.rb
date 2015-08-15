feature 'Viewing peeps' do

  scenario ' I can see existing peeps on the main page' do
    Peep.create(message: 'Test message')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Test message')
    end
  end

  scenario ' I can see time stamps on peeps' do
    Peep.create(message: 'Test message', time: '14:11')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('14:11')
    end
  end
end
