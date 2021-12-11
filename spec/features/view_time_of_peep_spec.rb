feature 'View time' do
  scenario 'it should show the time of the added peep' do
    allow_any_instance_of(Message).to receive(:created_at).and_return('12:25')
    login_in_and_peep
    expect(page).to have_content('12:25')
  end
end
