feature 'Viewing peeps' do
  scenario 'The user can see the peeps' do
    Peep.create(message: 'I am eating an apple')
    visit('/peeps')
    expect(page).to have_content 'I am eating an apple'
  end
end
