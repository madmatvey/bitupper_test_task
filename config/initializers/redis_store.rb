uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/").to_s
# REDIS = Redis.new(:url => uri)
Bitupper::Application.config.cache_store = :redis_store, uri
Bitupper::Application.config.session_store :redis_store, redis_server: uri
