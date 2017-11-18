feature 'posting a peep' do
  scenario 'the peep appears on the page with the time it was added and username' do
    allow(Time).to receive(:now).and_return(Time.parse('2017-11-18 13:57:25 +0000'))
    sign_up('timmy', 'timmy@hello.com')
    post_peep('Hi there!')
    expect(page).to have_content('Hi there! 2017-11-18 13:57:25 +0000 timmy')
  end

  scenario 'the peep is added to the database' do
    sign_up('timmy', 'timmy@hello.com')
    post_peep('Hi there!')
    expect(Peep.all.length).to eq 1
  end

  scenario 'peeps show up in reverse order' do
    sign_up('timmy', 'timmy@hello.com')
    post_peep('Hi there!')
    post_peep('Hello!')
    expect(page).to have_selector("ul li:nth-child(1)", text: 'Hello!')
    expect(page).to have_selector("ul li:nth-child(2)", text: 'Hi there!')
  end
end

feature 'individual peeps' do
  scenario 'can see peeps posted by one user' do
    sign_up('timmy', 'timmy@hello.com')
    post_peep('Hi there!')
    sign_up('bobby', 'bobbyy@hello.com')
    post_peep('Hello!')
    visit '/timmy'
    expect(page).to have_content('Hi there!')
    expect(page).not_to have_content('Hello!')
  end
end
