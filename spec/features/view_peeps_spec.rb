feature 'viewing peeps' do
  scenario 'A user can see peeps' do
    visit('/peeps')

    expect(page).to have_content("Hi rio do u want picking up in the morning pal")
    expect(page).to have_content("Mr bean. Funny")
  end
end
