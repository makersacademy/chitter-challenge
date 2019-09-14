feature 'Post a message' do
  scenario 'peep on chitter' do
    Peep.delete_all
    visit '/peep'
    fill_in 'new_peep', with: 'my first peep'
    click_button 'Post_Peep'
    expect(page).to have_content 'my first peep'
  end
  # scenario 'peep again' do
  #   visit '/peep'
  #   fill_in 'new_peep', with: 'my second peep'
  #   click_button 'Post_Peep'
  #   expect(page).to have_content 'my first peep'
  #   expect(page).to have_content 'my second peep'
  # end
end
