$LOAD_PATH.unshift(__dir__)
ENV["RACK_ENV"] ||= "development"

require "active_record"
require "hash_dot"
require "sinatra"

Hash.use_dot_syntax = true

require "lib/config"

ActiveRecord::Base.configurations = Config[:database]
ActiveRecord::Base.establish_connection
ActiveRecord.default_timezone = :utc

Dir["app/models/*.rb"].each { |r| require r }

configure do
  set :root, __dir__
  set :public_folder, "public"
end

get "/" do
  # serve from public/index.html
  send_file File.join(settings.public_folder, "index.html")
end
