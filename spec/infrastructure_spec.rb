feature 'infrastructure' do
  scenario 'testing web infrastructure' do
    visit '/infrastructure'
    expect(page).to have_content 'infrastructure working'
  end
end
