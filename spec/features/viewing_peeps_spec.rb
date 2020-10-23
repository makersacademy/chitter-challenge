feature 'viewing a list of peeps, with authors and timestamps' do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }
  let(:oldest_peep_time) { '2020-08-24 21:05:0.000001' }
  let(:oldest_peep) { 'an older peep' }
  let(:newest_peep_time) { '2020-08-24 21:10:0.000001' }
  let(:newest_peep) { 'a newer peep' }
  let(:date_format) { '%d-%m-%Y %H:%M' }
  
  before do
    user = DatabaseConnection.query("INSERT INTO users (name, username, email, password) VALUES ('#{user}','#{username}','#{email}','#{password}') RETURNING id")
    DatabaseConnection.query("INSERT INTO peeps (body, created_at, user_id) VALUES ('#{oldest_peep}', '#{oldest_peep_time}', '#{user[0]['id']}'), ('#{newest_peep}', '#{newest_peep_time}', '#{user[0]['id']}')")
  end
  
  scenario 'with multiple peeps, displayed reverse chronologically' do
    visit '/chitter'
    # save_and_open_page
    first_peep = find('.peep', match: :first)
    expect(first_peep).to have_content newest_peep
    expect(first_peep).to have_content username
    expect(first_peep).to have_content formatted_date(newest_peep_time)
    expect(page).to have_content oldest_peep
    expect(page).to have_content formatted_date(oldest_peep_time)
  end
end
