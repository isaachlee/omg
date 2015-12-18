
get '/text' do
  @translated_string
  erb :index
end

post '/text' do
  # text = params[:text]
  # text_array = text.split(" ")
  # @translated_string = []
  # website_friendly = text_array.join("%20")
  # @translated_string = RestClient.get "young-peak-8904.herokuapp.com/api/#{website_friendly}"
  @destination_number = params[:number]

  text = params[:text].upcase
  translated_array = []
  text_array = text.split(" ")
  text_array.each do |word|
    # leet_word = []
    # omg_word = translate_omg(word)
    # split_word = omg_word.split('')
    # split_word.each do |letter|
      # debugger
      # leet_word << to_leet(letter)
    # end
    # translated_array << leet_word.join('')
  # end
  # @translated_string = translated_array.join(" ")
  translated_array << translate_omg(word)
  @translated_string = translated_array.join(" ")
  end


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