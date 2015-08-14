feature 'Viewing peeps' do

  scenario 'I can see existing peeps on the peeps page' do
    Peep.new(text: 'Hello world!')
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end

end