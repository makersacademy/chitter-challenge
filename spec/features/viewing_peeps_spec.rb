feature 'viewing peeps' do
  scenario 'peeps are visible' do
    Peep.create(text: 'Hello!', time: 'Now', user_id:'1')
    Peep.create(text: 'Hello again!', time: 'Later than now', user_id:'2')
   

    visit '/index'

    expect(page).to have_content('Hello')
    expect(page).to have_content('Now')
  end
end
