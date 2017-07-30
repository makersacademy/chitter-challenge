feature 'See the time a post was made' do
  scenario 'User posts a peep and can the time that it was made' do
    post_peep
    time = "#{Time.new.hour}:#{Time.new.min}"
    expect(page).to have_content("My first peep! (#{time})")
  end
end
