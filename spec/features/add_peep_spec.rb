feature 'Adding a peep' do
  scenario 'User can post a peep and see it appear' do
    visit '/user_page'
    fill_in 'text', with: 'I will Make America Great Again #MAGA'
    fill_in 'user_name', with: 'Donald Trump'
    fill_in 'handle', with: 'POTUS'
    click_on 'Submit'
    expect(page).to have_content 'I will Make America Great Again #MAGA'
    expect(page).to have_content 'Donald Trump'
    expect(page).to have_content '@POTUS'
  end
end
