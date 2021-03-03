feature 'posting a peep' do
  scenario 'peep visible after posting' do
    sign_up_and_get_peeping

    click_button 'Peep'
    fill_in('peep', with: 'Building chitter')
    click_button 'Post'

    expect(page).to have_content('Building chitter')
    expect(current_path).to eq('/peeps')
  end
end
