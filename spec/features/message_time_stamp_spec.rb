feature 'Message time stamp' do
  scenario 'A new peep records the time it was created' do
    visit('/')
    fill_in('message', with: 'Time test message')
    click_button('Peep')
    expect(page).to have_content(Time.now.to_s.split.first(2).join(" "))
  end
end
