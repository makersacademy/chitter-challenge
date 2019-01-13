feature 'Peep' do
  scenario 'User can post a peep' do
    send_peep
    expect(page).to have_content('One man must peep')
  end

  scenario 'User can see time at which peep was made' do
    send_peep
    expect(page).to have_content Time.new.strftime('%d-%m-%Y %H:%M:%S')
  end
end
