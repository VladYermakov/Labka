configure :development do
  set :database, "sqlite3://#{SITE_ROOT}/db/dev.db"
  set :show_exceptions, true
end

configure :production do
  db = URI.parse(ΕΝV['DATABASE_URL'] || 'postgres:///localhost/mydb')

  ActiveRecord::Base.estabilish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
  )
end