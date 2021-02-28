feature 'Feed' do
  scenario 'A user can see a feed of all posted peeps' do
    connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
    user = User.new('Sandy', 'Pounoussamy', 'sandy974', 'pounoussamy.sandy@gmail.com', '1234')
    peep = "Who wants to know what I had for lunch?!"
    connection.exec("INSERT INTO peeps (user_id, posted_time, content) VALUES('#{user.id}', current_timestamp, '#{peep}')")

    visit('/feed')
    fill_in('content', with:"#{peep}")
    click_button('Cheet')

    expect(page).to have_content("#{peep}")
    expect(page).to have_content("#{user.username}")
  end
end
