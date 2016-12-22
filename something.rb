# #require 'pg'
# require_relative 'products'
#
# def main #create_table_main
#   #conn = PG.connect(dbname: 'products')
#   initialize
#   disable_notices(conn)
#
#   create_products_table(conn)
#
#   create_products(conn, 'popsicles', 2.99, 5)
#   create_products(conn, 'hotdogs', 4.99, 10)
#   # create_products(conn, name, price, quanity)
#   # create_products(conn, name, price, quanity)
#   # create_products(conn, name, price, quanity)
#   puts conn
#
#
# end
#
# # def main
# #   # conn = PG.connect(bdname: 'products')
# #   # products = table_name
# #   # def disable_notices(conn)
# #
# #   #starting function/ def get_query_option
# #   puts "Would you like to search the #{products} table, add new data,
# #   update already exsisting data, or remove data? "
# #   query_option = gets.chomp
# #   #gets = search or add or update or delete
#
#   #start_query_option(query_option)
#   # if search
#   #   call def search_data
#   # end
#   # if add
#   #   call def add_to_data
#   # end
#   # if update
#   #   call def update_data
#   # end
#   # if remove
#   #   call def remove_data
#   # end
#
#
#
#
# main if __FILE__ == $PROGRAM_NAME
