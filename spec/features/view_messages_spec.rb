feature 'View messages' do
  scenario 'user can view messages on a feed' do
    Message.post(username: 'riya', message: "Happy Easter")
    time = Time.new.strftime('%F %k:%M:00')
    visit '/chitter_feed'
    expect(page).to have_content "Happy Easter"
    expect(page).to have_content "@riya"
    expect(page).to have_content time
  end
end
