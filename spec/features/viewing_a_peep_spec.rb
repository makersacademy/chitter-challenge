feature 'Viewing peeps' do
  let(:peep_time) { Time.now.strftime('%H:%M') }
  let(:peep_date) { Time.now.strftime('%d/%m/%y') }
  
  scenario 'A user can see when a peep was posted' do
    visit('/chitter')

    fill_in('peep', with: 'Test peep')
    click_on 'Peep!'
  
    expect(page).to have_content "Peeped at #{peep_time} on #{peep_date}"
  end

  scenario 'A user can see who posted a peep' do
    visit('/chitter')

    fill_in('user_name', with: 'TestUser')
    fill_in('password', with: 'password')
    fill_in('peep', with: 'Test peep')
    click_on 'Peep!'

    expect(page).to have_content "Peeper: TestUser"
  end
end
