feature 'Viewing peeps' do
  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(content: 'This website is so cool')
    visit '/peeps'
    expect(page.status_code).to eq 200
    expect(page).to have_content('This website is so cool')
  end
end
