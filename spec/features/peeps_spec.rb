feature 'viewing and adding peeps' do

  scenario 'A user can see a list of peeps' do
    visit '/'
    expect(page).to have_content('Peeps')
  end

end
