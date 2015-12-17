
post '/text' do
  text = params[:text].upcase
  text_array = text.split(" ")
  translated_array = []
  text_array.each do |word|
    translated_array << translate_omg(word)
  end
  @translated_string = translated_array.join(" ")

  erb :index
end