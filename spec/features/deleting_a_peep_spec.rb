
feature 'Deleting a Peep' do

  scenario 'when signed in and the owner of a peep' do

    sign_up
    fill_in :peep, with: 'Lorem ipsum dolor si amet'
    click_button('Post Peep')
    click_button('Delete')
    expect(page).to have_content('Peep deleted!')
    expect(page).not_to have_content('Lorem ipsum dolor si amet')

  end

  scenario 'when not the owner of a peep' do

    double_sign_up_with_peep
    expect(page).to have_content('Lorem ipsum dolor si amet')
    expect(page).not_to have_content('Delete')

  end

end
