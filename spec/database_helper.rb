require 'pg'
require_relative '../lib/database_connection'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'makersbnb_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end