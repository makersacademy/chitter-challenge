feature 'viewing cheets' do
  it 'allows me to see a list of cheets' do
  sign_up
  fill_in :write, with: 'Hi'
  fill_in :time, with: 11111111111111
  click_button 'Submit Cheet'
  expect(page).to have_content 'Hi'
end
end
