require 'pg'

feature 'viewing peeps feed' do 
  scenario 'A user can see a list of peeps on their feed' do 
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'WAAASSUPPPPPPPPP XDDDD', CURRENT_TIMESTAMP, 'ThatDude');")
    connection.exec("INSERT INTO peeps VALUES(2, 'I bet you $317,083,791,653 you did not read that number, Lol I got you again the last 3 is not a 3 it’s the Russian letter for Z', CURRENT_TIMESTAMP, 'ItsMeAgain');")
    connection.exec("INSERT INTO peeps VALUES(3, 'WAAASSUPPPPPPPPP ThatDude!!', CURRENT_TIMESTAMP, 'OtherDude');")

    visit('/feed')

    expect(page).to have_content "WAAASSUPPPPPPPPP XDDDD"
    expect(page).to have_content "I bet you $317,083,791,653 you did not read that number, Lol I got you again the last 3 is not a 3 it’s the Russian letter for Z"
    expect(page).to have_content "WAAASSUPPPPPPPPP ThatDude!!"
  end
end 