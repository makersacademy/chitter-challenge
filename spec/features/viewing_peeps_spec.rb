feature 'Viewing peeps' do
  scenario 'Should list all the peeps' do
    visit('/peeps')
    expect(page).to have_content 'This is a new peep'
  end
end
