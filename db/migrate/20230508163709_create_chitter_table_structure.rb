class CreateChitterTableStructure < ActiveRecord::Migration[7.0]
  def change    
    create_table :peeps do |t|
      t.string :text
      # below adds two columns that are automatically populated: created_at, updated_at
      t.timestamps
      t.integer :user_id
    end

    create_table :users do |t|
      t.string :password
      t.string :email_address
    end

    add_foreign_key :peeps, :users, name: :fk_user, on_delete: :cascade

    create_table :tags do |t|
      t.string :content
    end
  end
end

# i've since learned this is bad form. I should have done separate migrations for each table.
# Also the join table didn't create in this migration. 
# I think because it is in a separate method to the others.
