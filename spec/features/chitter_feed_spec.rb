feature 'the Chitter feed' do
  scenario 'all posts should be shown in reverse chronological order' do

    Timecop.freeze(Date.today) do
      visit '/'
      fill_in 'message', with: "Huzzah!!!"
      click_button 'Submit'
    end

    Timecop.freeze(Date.today + 1) do
      visit '/'
      fill_in 'message', with: "Tremendous!!!"
      click_button 'Submit'
    end

    Timecop.freeze(Date.today + 2) do
      visit '/'
      fill_in 'message', with: "Magnificient!!!"
      click_button 'Submit'
    end

    expect("Magnificient!!!").to appear_before("Tremendous!!!")
    expect("Tremendous!!!").to appear_before("Huzzah!!!")
  end
end
