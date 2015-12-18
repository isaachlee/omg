enable :sessions
use Rack::Flash

get '/' do
  redirect '/text'
end

