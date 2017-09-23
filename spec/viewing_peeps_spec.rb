feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(title: 'Hello There', text: 'Wadadubdub')
    visit '/peeps'
    expect(page.status_code).to eq(200)
    expect(page).to have_content('Hello There')
  end
end
