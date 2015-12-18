
get '/text' do
  @translated_string

  erb :index
end

post '/text' do
  text = params[:text]
  text_array = text.split(" ")
  @translated_string = []
  website_friendly = text_array.join("%20")

  #if method == "omg"
    @translated_string = RestClient.get "young-peak-8904.herokuapp.com/omg_api/#{website_friendly}"

  #if method == "leet"
    @translated_string = RestClient.get "young-peak-8904.herokuapp.com/leet_api/#{website_friendly}"

  #if method == "awesome"
    omg_text = RestClient.get "young-peak-8904.herokuapp.com/omg_api/#{website_friendly}"
    omg_text_array = omg_text.split(" ")
    omg_website_friendly = omg_text_array.join("%20")
    @translated_string = RestClient.get "young-peak-8904.herokuapp.com/leet_api/#{omg_website_friendly}"

  # text = params[:text].upcase
  # translated_array = []
  # text_array = text.split(" ")
  # text_array.each do |word|
  #   leet_word = []
  #   omg_word = translate_omg(word)
  #   split_word = omg_word.split('')
  #   split_word.each do |letter|
  #     leet_word << leetspeak(letter)
  #   end
    # translated_array << leet_word.join('')
  #   translated_array << translate_omg(word)
  # end
  #   @translated_string = translated_array.join(" ")




  # @destination_number = "+" + params[:phone_number]
  # account_sid = ENV["ACCOUNT_SID"]
  # auth_token = ENV["AUTH_TOKEN"]
  # @client = Twilio::REST::Client.new account_sid, auth_token

  # @client.account.messages.create({
  #   :from => ENV["PHONE_NUMBER"],
  #   :to => @destination_number,
  #   :body => @translated_string
  #   })


#word array
  # words = api_response.split(' ')
  # debugger
  # words.each do |word|
    # leet_array = []
  #   letters = word.split('')
  #   letters.each do |letter|
  #     leet_array << to_1337(letter)
  #   end
  #   @translated_string << leet_array.join('')
  # end
  # debugger
  # @translated_string.join(" ")
  erb :index
end