get "/api/:word" do
  text = params[:word].upcase
  text_array = text.split(" ")
  translated_array = []
  text_array.each do |word|
    translated_array << translate_omg(word)
  end
  @translated_string = translated_array.join(" ")
  return @translated_string.to_json
end