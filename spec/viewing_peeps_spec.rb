feature 'viewing peeps' do
  scenario 'User can view peeps' do

    sally = Maker.create(username: 'sallywag', email: 'sally@dogs.com', password: 'sally1')
    Peep.create(text: 'Peep peep!', time: Time.now, maker: sally)
    sign_in
    expect(page.status_code).to eq 200
    expect(page).to have_content('Peep peep!')
  end
end
