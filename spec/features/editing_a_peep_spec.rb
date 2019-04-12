feature 'Editing a peep' do
  scenario 'A user can edit a peep' do
    peep = Peep.create(content: 'Peep peep')
    visit('/peeps')
    expect(page).to have_content('Peep peep')

    click_button 'Edit'
    expect(current_path).to eq "/peeps/#{peep.id}/edit"

    fill_in('content', with: "pop bang whizz")
    click_button('Update')

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content('Peep peep')
    expect(page).to have_content('pop bang whizz')
  end
end
