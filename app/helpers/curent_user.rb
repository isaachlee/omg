helpers do

	def current_user
		@current_user ||= User.where(id: session[:id]).first if session[:id]
	end

  def translate_omg(word)
  word_reference = word
  case word
  when word == 'AWESOME'
    return 'ERSUM'
  when word == 'BANANA'
    return 'BERNERNER'
  when word == 'BAYOU'
    return 'BERU'
  when word == 'FAVORITE'
    return 'FRAVRIT'
  when word == 'FAVOURITE'
    return 'FRAVRIT'
  when word == 'GOOSEBUMPS'
    return 'GERSBERMS'
  when word == 'LONG'
    return 'LERNG'
  when word == 'MY'
    return 'MAH'
  when word == 'THE'
    return 'DA'
  when word == 'THEY'
    return 'DEY'
  when word == 'WE\'RE'
    return 'WER'
  when word == 'YOU'
    return 'U'
  when word == 'YOU\'RE'
    return 'YER'
  end

  word = word.gsub(/[AEIOU]$/, '') if word_reference.length > 2
  word = word.gsub(/[^\w\s]|(.)(?=\1)/, '')
  word = word.gsub(/[AEIOUY]{2,}/, 'E')
  word = word.gsub(/OW/, 'ER')
  word = word.gsub(/AKES/, 'ERKS')
  word = word.gsub(/[AEIOUY]/, 'ER')
  word = word.gsub(/ERH/, 'ER')
  word = word.gsub(/MER/, 'MAH')
  word = word.gsub('ERNG', 'IN')
  word = word.gsub('ERPERD', 'ERPED')
  word = word.gsub('MAHM', 'MERM')
  word = 'Y' + word if word_reference[0] == 'Y'
  word = word.gsub(/[^\w\s]|(.)(?=\1)/, '')
  word[-3..-1] = 'LO'if ((word_reference[-3..-1] == 'LOW') && (word[-3..-1] == 'LER'))
  return word
end

end