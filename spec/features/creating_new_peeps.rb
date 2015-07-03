feature 'Viewing peeps' do
  scenario 'I can see existing links on the peeps page' do
    Peep.create content: 'My first peep', user: 'leggsimon'
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content 'My first peep'
    end
  end
end