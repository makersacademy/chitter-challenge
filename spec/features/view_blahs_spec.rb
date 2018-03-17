feature 'Viewing blahs' do
  scenario 'A user can see all blahs' do
    visit('/blahs')

    expect(page).to have_content 'One blah'
    expect(page).to have_content 'Two blah'
    expect(page).to have_content 'Three blah'
  end
end
