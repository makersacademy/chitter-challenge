feature 'See the time a post was made' do
  scenario 'User posts a peep and can the time that it was made' do
    post_peep
    time = Time.now.strftime("%d %b %H:%M")
    expect(page).to have_content(time)
  end
end
