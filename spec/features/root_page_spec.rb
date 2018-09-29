feature 'set up' do

  scenario 'visit page' do
    visit '/'
    expect(page).to have_content "Twittarr"
  end
end

feature 'viewing messages' do
  scenario 'user sees messages' do
    visit '/'
    expect(page).to have_content "Arrr, my spleen!"
    expect(page).to have_content "Me pantaloons are on me head."
    expect(page).to have_content "Her locker is like davey jones locker!"
  end
end
