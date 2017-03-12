module Helpers
  def sign_up
    click_link 'Sign Up'
    fill_in :email, with: 'sam@makersacademy.com'
    fill_in :password, with: 's3cr3t'
    fill_in :name, with: 'Samuel Russell Hampden Joseph'
    fill_in :username, with: 'tansaku'
    click_button 'Submit'
  end

  def first_peep
    visit ('/post-peep')
    fill_in 'peep_content', with: "First peep!"
    click_button ('Post peep')
  end
end
