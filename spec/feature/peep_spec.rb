feature 'user can peep' do
  scenario 'user can compose a peep and it is saved to the database' do
    visit '/'
    click_on 'PEEP'
    fill_in 'peep', with: 'Looking forward to brunch'
    click_button('PEEP')
    expect(page).to have_content('Looking forward to brunch')
  end
end
