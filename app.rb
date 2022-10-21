$LOAD_PATH.unshift(__dir__)
ENV["RACK_ENV"] ||= "development"

require "active_record"
require "hash_dot"

Hash.use_dot_syntax = true

require "lib/config"

ActiveRecord::Base.configurations = Config[:database]
ActiveRecord::Base.establish_connection
ActiveRecord.default_timezone = :utc

Dir["app/models/*.rb"].each { |r| require r }

require "pry"
binding.pry