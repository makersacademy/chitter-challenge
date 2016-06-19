
feature 'Post Peep' do

  scenario 'can post messages (peeps) on Chitter' do
    sign_up
    fill_in :peep, with: 'Had a hard morning today!'
    click_button 'Post'
    expect(current_path).to eq '/posts/view'
    expect(page).to have_content 'Had a hard morning today!'
  end

end