require './spec/database_helpers'

feature 'Viewing peeps' do
  let(:peep_time) { Time.now.strftime('%H:%M') }
  let(:peep_date) { Time.now.strftime('%d/%m/%y') }

  before(:each) do
    sign_up
    sign_in
  end

  scenario 'A user can see when a peep was posted' do
    visit('/chitter/userpage')

    fill_in('peep', with: 'Test peep')
    click_on 'Peep!'
  
    expect(page).to have_content "Peeped by # at #{peep_time} on #{peep_date}"
  end
end
