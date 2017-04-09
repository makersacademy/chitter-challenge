feature 'profile page' do
  scenario 'can click on username to visit profile page' do
    john = Maker.create(username: 'john', email: 'john@john.com', password: 'john1')
    Peep.create(text: 'i am john', time: Time.now, maker: john)
    visit '/peeps'
    click_link 'john'
    expect(page).to have_content "john's peeps"
    expect(page).to have_content 'i am john'
  end
end
