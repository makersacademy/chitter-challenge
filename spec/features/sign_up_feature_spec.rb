require 'pg'

feature 'Sign up to Chitter' do
  scenario 'user can sign up to Chitter' do
    visit '/'
    click_button 'sign_up'
    fill_in :name, with: 'Test One'
    fill_in :username, with: 'Test1'
    fill_in :email, with: 'test@testhere.com'
    fill_in :password, with: 'Password123'
    click_button 'Submit'
    con = PG.connect dbname: 'chitter_test'
    result = con.exec "SELECT * FROM chitter_users where id = '1'"
    expect(result.values[0][1]).to eq('test@testhere.com')
  end
end
