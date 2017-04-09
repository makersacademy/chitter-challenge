feature 'can filter peeps by maker' do
  scenario 'when i click on a username i see peeps by that maker' do
    john = Maker.create(username: 'john', email: 'john@john.com', password: 'john1')
    Peep.create(text: 'i am john', time: Time.now, maker: john)
    sign_in
    click_link 'john'
    expect(page).to have_content('i am john')
  end
end
