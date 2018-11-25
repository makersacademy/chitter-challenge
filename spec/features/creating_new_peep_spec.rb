feature 'post new peep' do
  scenario 'user can post a new peep' do
    visit '/'
    fill_in('body', with: 'test peep')
    click_button('Post new peep')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'test peep'
  end
end
