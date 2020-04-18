feature 'editing peeps' do
  scenario 'user edits a peep' do
    sign_up
    add_peep

    first('.peep').click_button 'Edit'
    fill_in 'body', with: 'Hello world!'
    click_button 'Post'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'My first peep'
    expect(page).to have_content 'Hello world!'
  end

  scenario 'user cannot edit a peep which is not theirs' do
    sign_up
    add_peep
    click_on :'Log Out'
    sign_up_alt

    expect(first('.peep')).not_to have_selector(:link_or_button, 'Edit')
  end
end
