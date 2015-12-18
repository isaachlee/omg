
get '/text' do
  @translated_string

  erb :index
end

post '/text' do
  text = params[:text]
  text_array = text.split(" ")
  @translated_string = []
  website_friendly = text_array.join("%20")

  case params[:encode]
  when "omg"
    @translated_string = RestClient.get "young-peak-8904.herokuapp.com/omg_api/#{website_friendly}"

  when "leet"
    @translated_string = RestClient.get "young-peak-8904.herokuapp.com/leet_api/#{website_friendly}"

  when "both"
    omg_text = RestClient.get "young-peak-8904.herokuapp.com/omg_api/#{website_friendly}"
    omg_text_array = omg_text.split(" ")
    omg_website_friendly = omg_text_array.join("%20")
    omg_website_friendly[0] = ""
    omg_website_friendly[-1] = ""
    @translated_string = RestClient.get "young-peak-8904.herokuapp.com/leet_api/#{omg_website_friendly}"
  end

  @destination_number = "+" + params[:phone_number]
  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV["AUTH_TOKEN"]
  @client = Twilio::REST::Client.new account_sid, auth_token

  @client.account.messages.create({
    :from => ENV["PHONE_NUMBER"],
    :to => @destination_number,
    :body => @translated_string
    })

  erb :index
end