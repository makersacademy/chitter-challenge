feature 'Viewing peeps' do
  scenario 'user wants to see peeps' do
    visit('/peeps')

    expect(page).to have_content('Test peep text')
    expect(page).to have_content('Another test peep text')
  end
end
