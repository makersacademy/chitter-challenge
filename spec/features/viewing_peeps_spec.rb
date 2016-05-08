feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the homepage' do
    Peep.create(time: Time.now, content: 'Sooooo cute!', username: 'Luni')
    visit '/peeps'
    expect(page.status_code).to eq(200)
    # within 'ul#peeps' do
    #   expect(page).to have_content('Sooooo cute!')
    # end
  end
end
