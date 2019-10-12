feature 'Posting a new peep' do
  scenario 'A user can post a peep to Chitter' do
    sign_up
    fill_in('content', with: 'The answer, my friend, is blowing in the wind!')
    click_button 'Post'

    expect(page).to have_content 'The answer, my friend, is blowing in the wind!'
  end
end