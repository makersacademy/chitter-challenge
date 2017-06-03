feature 'Viewing peeps' do
  scenario 'I can see existing links on the links page' do
    Peep.create(post: 'Makers Academy Rocks', user: 'George')

    visit '/peeps'
    expect(page.status_code).to eq 200

    within 'ul#peeps' do
      expect(page).to have_content('Makers Academy Rocks')
    end
  end
end
