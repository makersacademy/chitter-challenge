require_relative 'peep'

class PeepRepository
   
    def all
        peeps = []
      # Executes the SQL query:
      sql='SELECT id, content, time, user_id FROM peeps;'
      result_set = DatabaseConnection.exec_params(sql, [])
      result_set.each do |record|
        peep = Peep.new
        peep.id = record['id'].to_i
        peep.content = record['content']
        peep.time = record['time']
        peep.user_id = record['user_id']
        peeps << peep
      end
      return peeps
    end
    #def find
       # Executes the SQL query:
       # SELECT name, unit_price, quantity_unit, order_id FROM albums where id = $1;
       #Returns a single Item objects.
       # Executes the SQL query:
       # SELECT item_name, order_date, customer_name FROM albums where id = $1; 
       #Returns a single Order objects.
    #end
  
    # Insert a new Item
    # Item is a new Item object
    # def create(Post)
       #INSERT INTO items table(name, unit_price, quantity_unit, order_id) VALUES($1, $2, $3, $4);
       # returns nothing
     #end
  
     # Insert a new Order
     # Item is a new order object
     #def create(time)
       # INSERT INTO orders table (item_name, order_date, customer_name ) values($1, $2, $3);
       # returns nothing
     #end
  end
