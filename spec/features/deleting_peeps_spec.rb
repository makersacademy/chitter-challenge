feature 'deleting peeps' do
  scenario 'peep no longer visible after deleting' do
    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building Chitter')
    click_button 'Post'

    click_button 'My Peeps'

    expect(page).to have_content 'Building Chitter'

    click_button 'Delete'

    expect(current_path).to eq '/peeps'
    expect(page).not_to have_content 'Building Chitter'
  end
end
