feature 'creating peeps' do
  scenario 'user can create a peep' do
    visit '/peeps/new'

    fill_in('text', with: 'love is everywhere')
    click_button('Submit')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content('love is everywhere')
  end
end
