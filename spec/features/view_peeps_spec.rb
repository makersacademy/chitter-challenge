feature 'Viewing peeps' do 
  scenario 'User sees existing peeps on the peeps page' do 
    Peep.create(:content => 'This is the first peep.',
                :time => Time.now.strftime("%H:%M:%S %d-%m-%Y")
                )
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('This is the first peep.')
  end
end