uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://localhost:6379/").to_s
REDIS = Redis.new(url: uri)
