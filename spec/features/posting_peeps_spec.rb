feature 'posting a new peep' do
  scenario 'a user can click on new peep button' do
    user_login
    click_button('New peep')
    expect(page).to have_content 'Enter new peep'
  end

  scenario 'a user can post a peep in Chitter' do
    user_login
    click_button('New peep')
    fill_in('peep', with: 'What a sunny day!!')
    click_button('Post!')

    expect(page).to have_content 'What a sunny day!!'
  end
end
