feature 'Writing a new peep' do
  scenario 'A user can peep' do
    visit('/')
    fill_in('peep', with: 'What?')
    fill_in('username', with: 'Jake')
    click_button('Peeping!')

    expect(page).to have_content 'What?'
  end
end
