feature 'Seeing time posted' do
  scenario 'User posts a peep and can see when it was posted' do
    visit '/'
    fill_in 'text', with: 'I will Make America Great Again #MAGA'
    fill_in 'user_name', with: 'Donald Trump'
    fill_in 'handle', with: 'POTUS'
    click_on 'Submit'
    expect(page).to have_content 'I will Make America Great Again #MAGA'
    expect(page).to have_content 'Donald Trump'
    expect(page).to have_content '@POTUS'
    expect(page).to have_content 'Posted at'
  end
end
