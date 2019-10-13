feature 'Hate a Peep' do

  scenario 'I can hate a peep and see the value go down' do
    create_account
    sign_in
    fill_in('peep', with: 'test peep')
    click_button 'Peep It'
    expect(page).to have_content('Number of Loves: 0')
    click_button 'Hate'
    expect(page).to have_content('Number of Loves: -1')

  end

end
