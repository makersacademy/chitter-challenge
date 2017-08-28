feature 'viewing peeps' do
  before(:each) do
    Peep.create(text: 'Hello world!')
  end

  scenario 'I see my peeps displayed' do
    visit('/all')
    expect(page).to have_content($peeps)
  end
end
