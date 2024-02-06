require "sinatra"
require "sinatra/reloader"
require "http"
require "json"

get("/") do
  erb(:home)
end

get("/generator") do
  raw_data = HTTP.get("https://api.namefake.com/random/random")
  parsed_data = JSON.parse(raw_data)
  @generator = parsed_data.fetch("name")
  erb(:name_generator)
end
