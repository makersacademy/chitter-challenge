feature 'viewing cheets' do
  it 'allows me to see a list of cheets' do
  sign_up
  fill_in :write, with: 'Hi'
  expect(page).to have_content 'Hi'
end
end
