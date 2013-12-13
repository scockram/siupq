db = URI.parse('postgres://vagrant:@localhost/siupq')

ActiveRecord::Base.establish_connection(
  adapter:'postgresql',
  host: db.host,
  username:db.user,
  password:db.password,
  database:db.path[1..-1]
)

require_relative 'site'
require_relative 'record'
