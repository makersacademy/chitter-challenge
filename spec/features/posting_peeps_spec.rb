feature 'posting a new peep' do
  scenario 'a user can post a peep in Chitter' do
    visit '/peeps/new'
    fill_in('peep', with: 'What a sunny day!!')
    click_button('Post!')

    expect(page).to have_content 'What a sunny day!!'
  end
end
