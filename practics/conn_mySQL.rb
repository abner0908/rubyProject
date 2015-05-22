require 'mysql2'

client = Mysql2::Client.new(
host: "192.168.1.18",
username: "abner0908",
password: "510241",
database: "op_schd"
)
client.query('begin')

begin

  (1..10).each do |no|
    sql = "insert into time_log(tl_datetime, tl_remark) values(now(), #{no.to_s})"
    client.query(sql)
    sleep(1)
  end

rescue Exception => e
  puts "Inserting data into time_log fail!! DB rollback!!"
  puts e.to_s
  client.query('rollback')
  exit
end

client.query('commit')
puts 'Inserting data into time_log success!!'
client.close if client