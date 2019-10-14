feature 'Viewing peeps' do
  scenario 'peeps are displayed on homepage' do
    visit '/peep/new'
    fill_in('message', with: 'A new peep')
    click_button('Peep!')
    click_button('Post a peep')
    fill_in('message', with: 'Another new peep')
    click_button('Peep!')

    expect(page).to have_content 'A new peep'
    expect(page).to have_content 'Another new peep'
    expect(page).to have_content '2019'
  end
end
