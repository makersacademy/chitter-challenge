feature 'testing infrastructure' do
  scenario 'testing setup working' do
    visit '/'
    expect(page).to have_content("Welcome to chitter! Peep peep!")
  end
end
