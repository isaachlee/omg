get "/omg_api/:text" do
  text = params[:text].upcase
  text_array = text.split(" ")
  translated_array = []
  text_array.each do |word|
    translated_array << translate_omg(word)
  end
  @translated_string = translated_array.join(" ")
  return @translated_string.to_json
end

get "/leet_api/:text" do
text = params[:text].upcase
  translated_array = []
  text_array = text.split(" ")
  text_array.each do |word|
    leet_word = []
    split_word = word.split('')
    split_word.each do |letter|
      leet_word << leetspeak(letter)
    end
    translated_array << leet_word.join('')
    # translated_array << translate_omg(word)
    # @translated_string = translated_array.join(" ")
  end
  @translated_string = translated_array.join(" ")
  return @translated_string.to_json
end