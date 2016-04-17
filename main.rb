require "sinatra"
require "sinatra/activerecord"
#require "redcarpet"

Dir.glob('./app/{controllers,helpers,mailers,models}/*.rb').each { |file| require file }
Dir.glob('./config/*.rb').each { |file| require file }

set :views, settings.root + '/app/views'
set :public_folder, File.dirname(__FILE__) + '/app/assets'