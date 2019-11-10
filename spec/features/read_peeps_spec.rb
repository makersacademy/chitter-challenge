feature 'reading peeps' do
  scenario 'visiting the home page' do
    visit '/home'
    fill_in('peep', with: 'Peep peep')
    click_button('Post peep!')
    expect(page).to have_content 'Peep peep'
  end
end
