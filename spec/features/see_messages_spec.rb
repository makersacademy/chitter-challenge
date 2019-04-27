feature 'view all messages' do
  scenario 'retrieves peeps from database' do
    populate_table
    visit '/chitter'
    expect(page).to have_content 'test 1'
    expect(page).to have_content 'test 2'
    expect(page).to have_content 'test 3'
  end

  scenario 'peeps appear in reverse order, newest first' do
    populate_table
    visit '/chitter'
    expect(page.body.index('test 3')).to be < page.body.index('test 1')
  end

  scenario 'peeps show time stamp' do
    populate_table
    visit '/chitter'
    expect(page).to have_content 'posted at'
  end
end
