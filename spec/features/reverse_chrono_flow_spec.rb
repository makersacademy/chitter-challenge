feature ChitterController do
  scenario 'post a message to Chitter and see it posted' do
    visit '/flow/new'
    fill_in('message', with: 'Skynet has become self-aware')
    click_button('Submit')

    expect(page).to have_content 'Skynet has become self-aware'
  end
end
