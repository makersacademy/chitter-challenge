feature 'Post peep' do
  scenario 'I can post a peep, and see it' do
    visit '/'
    fill_in :peep, with: 'Peeping again'
    click_button 'Peep!'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'Peeping again'
    end
  end
end
