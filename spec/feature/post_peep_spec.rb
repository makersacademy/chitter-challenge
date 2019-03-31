feature 'user can post a peep' do
  scenario 'web site test' do
    visit('/')
    expect(page).to have_content('Chitter')
  end

  scenario 'post a peep' do
    visit('/')
    fill_in('peep', with: 'This is a peep')
    click_button('Submit')
    expect(page).to have_content('This is a peep')
  end
end