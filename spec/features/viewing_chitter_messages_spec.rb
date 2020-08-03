feature 'it prints messages' do
  scenario 'user should see messages on home page' do
    Message.create(user_id: 1, content: 'This is a third test')
    Message.create(user_id: 2, content: 'This is a fourth test')

    visit('/chitter')
    expect(page).to have_content('This is a third test')
    expect(page).to have_content('This is a fourth test')
    expect(page).to have_content('Alexis')
    expect(page).to have_content('2020')
  end
end
