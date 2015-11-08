feature 'Viewing Peeps' do
  scenario 'Peeps from multiple users' do
    post_a_peep_as_signed_in_user
    post_a_peep_as_signed_in_user_2
    expect(page).to have_content 'I feel mysterious today!'
    expect(page).to have_content 'JohnDoe'
    expect(page).to have_content 'Practice makes perfect!'
    expect(page).to have_content 'JoeBlow'
  end
end
