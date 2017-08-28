feature 'viewing peeps' do
  before(:each) do
    Peep.create(text: 'Hello world!')
  end
  # let (:peeps) { double $peeps }
  scenario 'I see my peeps displayed' do
    visit('/all')
    expect(page).to have_content($peeps)
  end
end
