feature 'Viewing peeps' do
  before do
    Peep.create(
      message: 'This is my peep',
      datetime: Time.now)
  end

  scenario 'People can view peeps' do
    visit('/peeps')
    expect(page).to have_content('This is my peep')
  end
end
