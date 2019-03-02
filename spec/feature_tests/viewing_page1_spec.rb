feature 'First page' do
  scenario 'shows peeps!' do
    visit '/'
    expect(page).to have_content 'Bobs first day'
  end
end
