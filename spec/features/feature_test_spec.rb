feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content "Byte me!"
    expect(page).to have_content "String me_along"
    expect(page).to have_content "SQL Clause is coming to town!"
  end
end
