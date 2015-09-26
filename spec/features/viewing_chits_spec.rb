feature 'Viewing chits' do

  scenario 'I can see existing chits on the chits page' do
    Chit.create(post: 'hello')
    visit '/chits'
    expect(page.status_code).to eq 200
    within 'ul#chits' do
      expect(page).to have_content('hello')
    end
  end
end
