feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(message: 'Trump here')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Trump here')
    end
  end

  scenario 'I can add peeps to the peeps page' do
    visit '/peeps/new'
    fill_in 'message', with: 'Trump here again'
    click_button 'Submit message'
    expect(page).to have_content('Trump here again')
  end
end
