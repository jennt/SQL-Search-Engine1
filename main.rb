require 'pg'
#class Products
#attr_accessor :conn
# def initialize(conn)
#   @conn = PG.connect(dbname: 'products')
#   @name = name
#   @price = price
#   @quanity = quanity
# end
# end
def disable_notices(conn)
  conn.exec('SET client_min_messages TO WARNING;')
end

def create_products_table(conn)
  conn.exec(
  'CREATE TABLE IF NOT EXISTS products (' \
  'id SERIAL PRIMARY KEY,' \
  'name VARCHAR,' \
  'price MONEY,' \
  'quanity INT)'
  )
end

def create_products(conn, name, price, quanity)
  sql = 'INSERT INTO products (name, price, quanity) ' \
  "SELECT '#{name}', '#{price}', '#{quanity}' " \
  'WHERE NOT EXISTS (' \
  'SELECT id FROM products ' \
  "WHERE name = '#{name}' AND price = '#{price}' AND quanity = '#{quanity}'" \
  ');'

  conn.exec(sql)
end

def get_query_option
  print "Would you like to 1)search the products table, 2)add data,
  3)update existing data, or 4)remove data? Enter 1, 2, 3, or 4:"
  query_option = gets.chomp.to_i
  # puts query_option
  return query_option
end

def search_entire_products_table(conn)
  products = conn.exec('SELECT * FROM products')
  products
end

def add_row_to_products(conn, name, price, quanity)
   values = conn.exec("INSERT INTO products VALUES(#{name}, #{price}, #{quanity})"
  )
  values
end

def update_row(column, value)
  conn.exec("UPDATE products SET #{column} = #{value}"
  )
end

def delete_row(column, value)
  ("DELETE FROM products WHERE #{column} = #{value}
  ")
end

def start_query_option(query_option, conn)
  #puts query_option
  if query_option == 1
    products = search_entire_products_table(conn)
    products.each do |product|
      puts product
  end

  elsif query_option == 2
    print "enter product name: "
    name = gets.chomp
    print "enter product price: "
    price = gets.chomp
    print "enter quanity: "
    quanity = gets.chomp.to_i

    create_products(conn, name, price, quanity)

    # row = add_row_to_products(conn, name, price, quanity)
    # row.each do |row|
    #   puts row

  #end
  elsif query_option == 3
    update_row(column, value)

  elsif query_option == 4
    delete_row(column, value)

  else
    puts "Not a valid option pick 1, 2, 3, or 4: \n"
  end
end


def main
  conn = PG.connect(dbname: 'products')
  #table_name = 'products'
  # query_option = 0
  disable_notices(conn)

  create_products_table(conn)

  create_products(conn, 'popsicles', 2.99, 5)
  create_products(conn, 'hotdogs', 4.99, 10)
  # create_products(conn, name, price, quantity)
  puts conn

  query_option = get_query_option

  start_query_option(query_option, conn)

  # new_row = create_products(conn, name, price, quanity)
  # add_row_to_products(conn, name, price, quanity)

end

main if __FILE__ == $PROGRAM_NAME #create_table_main
