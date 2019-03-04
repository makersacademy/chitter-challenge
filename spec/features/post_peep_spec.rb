feature 'Peeping' do
  scenario 'a new peep is posted' do
    visit('/')
    fill_in('message', with: 'it\'s a good time to try Chitter!')
    click_button('Peep!')

    expect(page).to have_content 'it\'s a good time to try Chitter!'
  end

  scenario 'a zero-length peep is not posted' do
    visit('/')
    click_button('Peep!')

    expect(page).not_to have_content("2019-03-03; 10:00;")
  end

  scenario 'a zero-length peep causes results in a notice appearing' do
    visit('/')
    click_button('Peep!')

    expect(page).to have_content "To peep, you have to say something!"

  end
end
