feature 'testing infrastructure' do
  scenario 'the functions work well on the homepage' do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end
end