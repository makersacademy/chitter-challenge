class CreateTables < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :username
      t.string :password
    end

    create_table :posts do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :content
      t.datetime :createdat
      t.timestamps
    end

    create_table :replies do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :post, index: true, foreign_key: true
      t.string :content
      t.datetime :repliedat
      t.timestamps
    end
  end
end
