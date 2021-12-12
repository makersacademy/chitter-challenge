feature 'Adding a peep' do
  scenario 'User can post a peep and see it appear' do
    sign_up_and_log_in
    peep_example
    expect(page).to have_content 'I will Make America Great Again #MAGA'
    expect(page).to have_content 'Donald Trump'
    expect(page).to have_content '@POTUS'
  end
end
