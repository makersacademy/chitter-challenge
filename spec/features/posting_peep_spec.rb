feature 'Posting peep' do
  scenario 'new peep' do
    peep = 'I am happy'
    visit('/')
    fill_in 'peep', :with => peep
    click_button 'Submit'
    expect(page).to have_content(peep)
  end
end
