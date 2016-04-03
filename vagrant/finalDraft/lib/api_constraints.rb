class ApiConstraints
	#skapar instansvariabler
	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	#kollar om versionen finns i Accept-headern
	def matches?(req)
		@default || req.headers['Accept'].include?("application/vnd.systemlocation-railsification.v#{@version}")
	end
end