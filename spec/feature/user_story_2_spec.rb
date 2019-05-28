feature 'DATABASE PEEPS' do

  scenario 'send button adds to database' do
    visit '/'
    click_button('Enter')
    fill_in('message', :with => 'Iya luuuv')
    click_button('send')
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM peep;")
    p "the message added was: #{result.first['message']}"
    expect(result.first['message']).to include('Iya luuuv')
  end

  scenario 'shows all peeps from database' do
    visit '/'
    click_button('Enter')
    fill_in('message', :with => 'Iya luuuv')
    click_button('send')
    fill_in('message', :with => 'Iya maaate')
    click_button('send')
    expect(page).to have_content('Iya luuuv')
    expect(page).to have_content('Iya maaate')
  end

end
