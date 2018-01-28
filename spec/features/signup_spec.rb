feature 'signup' do

  scenario 'I am stored in User table after signing up for the first time' do
    expect { sign_up("dan", "dan0", "aa@aa.com", "maths") }.to change(User, :count).by(1)
  end

  background do
    sign_up_as_clement
  end

  scenario 'I should be welcomed with my email after signing up' do
    expect(page).to have_text "Welcome Clement!"
  end

  scenario 'I am not stored in User table after signing up with the same email twice' do
    expect { sign_up("cle", "attle", "cricket@hotmail.com", "ilovecricket") }.not_to change(User, :count)
  end

  scenario 'I am not stored in User table after signing up with the same username twice' do
    expect { sign_up("cle", "Attles1883", "cricket2@hotmail.com", "ilovecricket") }.not_to change(User, :count)
  end

  scenario 'I error message comes up when I signup with same email' do
    sign_up("a", "a", "cricket@hotmail.com", "a")
    expect(page).to have_content("Sorry you've already signed up with this email")
  end

end
