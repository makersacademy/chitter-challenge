feature 'create peep post' do
  scenario 'submit create peep form' do
    visit('/')
    fill_in('peep', with: 'I am a peep.')
    click_button('peep')

    expect(page).to have_content('I am a peep.')
  end
end
