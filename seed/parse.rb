class String
  def rchomp(sep = $/)
    self.start_with?(sep) ? self[sep.size..-1] : self
  end
end

last_index = 0
utterance = ''
File.open("export.txt", "r") do |file_handle|
	file_handle.each_line do |line|
		data = line.split('|')
		index = data[0]

		data[1].gsub!(/\(.*\)/, '')
		data[1].gsub!(/\[.*\]/, '')
		data[1].gsub! '...',''
		data[1].strip!

		if index == last_index
			utterance << ' ' + data[1]
		else
			utterance.gsub!('. . .','')
			utterance.strip!
			utterance = utterance.rchomp('\'').chomp('\'')
			puts utterance
			utterance = data[1]
			last_index = index
		end

	end
end