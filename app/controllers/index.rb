enable :sessions
use Rack::Flash

get '/' do
  @translate_string
  erb :index
end

