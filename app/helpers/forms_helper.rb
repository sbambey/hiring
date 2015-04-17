module FormsHelper
	def to_title(string)
		string.gsub('_',' ').capitalize
	end
end
