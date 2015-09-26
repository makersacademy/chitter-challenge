feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.create(peep: 'hello world')
    visit '/'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('hello world')
    end
  end

end
