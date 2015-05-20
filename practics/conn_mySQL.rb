require 'mysql2'

client = Mysql2::Client.new(
    host: "localhost",
    username: "abner0908",
    password: "510241",
    database: "cmdev",
)
results  = client.query("select * from dept")

results.each { |row| puts row['dname'] }

client.close if client