feature ChitterController do
  scenario 'post a message to Chitter and see it with a time stamp' do
    visit '/flow/new'
    fill_in('message', with: 'Skynet has become self-aware')
    click_button('Submit')

    expect(page).to have_content '2021' # This test will break when the current year changes
  end
end
