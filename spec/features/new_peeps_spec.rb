feature 'Adding a new peep' do
  scenario 'A user can add a peep to chitter' do
    visit('/peeps/new')
    fill_in('comment', with: 'Best film? Mad Max... Mic drop!')
    click_button('Submit')

    expect(page).to have_content 'Best film? Mad Max... Mic drop!'
  end
end
