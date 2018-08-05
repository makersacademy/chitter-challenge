feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    insert_test_peeps 
    visit('/peeps')
    expect(page).to have_content 'Test peep 1 - Deep'
    expect(page).to have_content 'Test peep 2 - Deeper'
    expect(page).to have_content 'Test peep 3 - Deepest'
  end
end
