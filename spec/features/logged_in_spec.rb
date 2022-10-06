feature 'logged in' do
  scenario 'user logged in ' do
    visit('/chitter')

    expect(page).to have_content "Welcome !"
  end
end