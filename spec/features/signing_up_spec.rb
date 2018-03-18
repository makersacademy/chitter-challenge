feature 'signing up' do

  scenario 'the user signs up' do
    sign_up_erotic_dave
    expect(page).to have_content "Welcome, Erotic Dave!"
    expect(page).not_to have_content "Welcome, anonymous!"
  end

  scenario 'a signed up user posts and sees their name on their tweets' do
    sign_up_erotic_dave
    peep_text = "This is a new peep #{rand(1.1000)}"
    fill_in :new_peep_text, with: peep_text
    click_on 'Post'
    expect(page).to have_content "Peeped by Erotic Dave"
  end
  scenario 'the user signs up, signs out, then signs back in' do
    sign_up_erotic_dave
    click_on 'Sign Out'
    sign_in_erotic_dave
    expect(page).to have_content "Welcome, Erotic Dave!"
  end
end
