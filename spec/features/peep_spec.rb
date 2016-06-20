feature 'User can see peeps' do

  scenario 'I can see existing peeps' do
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('Peeps:')
  end
end
