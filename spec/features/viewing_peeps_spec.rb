feature 'viewing peeps' do
  scenario 'peeps are visible' do
    Peep.create(text: 'Hello!', time: 'Now')
    Peep.create(text: 'Hello again!', time: 'Later than now')
   

    visit '/index'

    expect(page).to have_content('Hello')
    expect(page).to have_content('Now')
  end
end
