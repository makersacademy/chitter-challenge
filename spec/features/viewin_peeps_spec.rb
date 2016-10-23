feature 'Viewing peeps' do
  before(:all) do
    Peep.create(text: 'I am feeling good')
  end

  scenario 'I can see existing peeps on the home page' do
    visit '/'
    expect(page).to have_content('I am feeling good')
  end

  scenario 'I can see existing peeps on the peeps page' do
    visit '/'
    sign_up
    expect(page).to have_content('I am feeling good')
  end
end
