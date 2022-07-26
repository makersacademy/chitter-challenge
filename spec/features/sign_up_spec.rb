# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Maker can sign-up to Chitter' do
  scenario 'Maker can signup on registrations page ' do
    visit('/registrations/sign-up')

    expect(current_path).to eq '/registrations/sign-up' 
    expect(page).to have_content('Nice to meet you!')

  end
end

