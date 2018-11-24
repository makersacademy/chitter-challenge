feature 'Viewing main page' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "WELCOME ON CHITTER!"
  end
end

feature 'Viewing main page' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "REGISTRATION FORM"
  end
end

feature 'Viewing main page' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "are you new? press here"
  end
end



feature 'Viewing main page' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "We'll never share your email with anyone else."
  end
end

feature 'Viewing main page' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Press here to continue."
  end
end

feature 'Viewing main page' do
  scenario 'visit the index page' do
    visit('/')
    expect(page).to have_content "Submit"
  end
end
