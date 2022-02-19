feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    visit('/peeps')
    expect(page).to have_content "Posting peeps is so much fun!"
    expect(page).to have_content "Loving this new database stuff"
  end
end