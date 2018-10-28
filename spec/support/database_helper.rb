require_relative '../../lib/database_connection'

module DatabaseHelper

  def add_two_peeps
    DatabaseConnection.query("INSERT INTO
      peeps (id, text, time, date, user_id)
      VALUES
      ('1', 'This is peep 1', '10:45:00', '2018-10-27', '1'),
      ('2', 'This is peep 2', '10:46:00', '2018-10-27', '2');"
    )
  end

  def add_user_to_db
    DatabaseConnection.query("INSERT INTO
      users (id, name, username, email, password)
      VALUES ('2','Ash Ketchum', '@red', 'ash@pallet.com', 'pikachu123');"
    )
  end

  def add_two_users_to_db
    DatabaseConnection.query("INSERT INTO
      users (id, name, username, email, password)
      VALUES
      ('2', 'Ash Ketchum', '@red', 'ash@pallet.com', 'pikachu123'),
      ('3', 'Gary Oak', '@blue', 'gary@pallet.com', 'eevee123');"
    )
  end
end
