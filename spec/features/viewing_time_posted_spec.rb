feature 'User can see what time a peep was posted' do
  scenario 'posts and can see timestamp' do
    create_peep('I am a test peep')
    expect(page).to have_content("I am a test peep Posted: #{Time.now.strftime('%d-%m-%Y %H:%M:%S')}")
  end
end
