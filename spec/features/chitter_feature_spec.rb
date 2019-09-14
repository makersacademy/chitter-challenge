feature 'Post a message' do
  scenario 'peep on chitter' do
    visit '/peep'
    fill_in 'new_peep', with: 'my first peep'
    click_button 'Post_Peep'
    expect(page).to have_content'my first peep'
  end
end
