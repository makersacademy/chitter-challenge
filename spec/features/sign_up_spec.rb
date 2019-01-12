feature 'A user can sign up to use chitter' do
  scenario 'A user signs up' do
    visit '/'
    click_on 'Sign Up'
    fill_in('Name', with: 'Magnus')
    fill_in('Username', with: 'The Crimson King')
    fill_in('Email', with: 'Magnus@1000sons.co.pr')
    fill_in('Password', with: 'ilovemagic')
    click_on 'Sign Up'

    expect(page).to have_content('Welcome Magnus')
    expect(page).to have_content('Email: Magnus@1000sons.co.pr')
    expect(page).to have_content('Username: The Crimson King')
  end

  scenario 'A user cannot sign up to chitter with the same email twice' do
    visit '/'
    click_on 'Sign Up'
    fill_in('Name', with: 'Horus')
    fill_in('Username', with: 'The Luna Wolf')
    fill_in('Email', with: 'Horus@SOH.co.ct')
    fill_in('Password', with: 'iloveheresy')
    click_on 'Sign Up'
    visit '/'
    click_on 'Sign Up'
    fill_in('Name', with: 'Horus2')
    fill_in('Username', with: 'The Luna Wolf2')
    fill_in('Email', with: 'Horus@SOH.co.ct')
    fill_in('Password', with: 'iloveheresy2')
    click_on 'Sign Up'

    expect(flash[:error]).to be_present
  end
end
