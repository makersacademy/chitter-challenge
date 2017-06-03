feature "Timestamps on messages" do
  scenario "User posts a message and sees the time on it" do
    visit('/new_peep')
    fill_in('message_body', with: 'Hello world!')
    click_button('Submit')
    expect(page).to have_content "#{Time.now.strftime("%d/%b/%Y %H:%M")} - Hello world!"
  end
end
