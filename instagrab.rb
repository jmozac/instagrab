require 'httparty'

def instagrab
	username = ARGV[0]
	url = "https://www.instagram.com/#{username}"
	puts "Username @#{username}"
	
	# REQUEST
	response = HTTParty.get(url)
	html=response.split("owner\":{\"id\":\"")
	# get user's id
	user_raw=html[1].split("\"}")
	puts "\s\sID \t\t: #{user_raw[0]}"
	# follower
	a=response.split("Followers,")
	b=a[0].split("content=\"")
	puts "\s\sFollowers\t: #{b[b.length-1].to_i}"
	# following
	c=a[1].split("Following,")
	puts "\s\sFollowing\t: #{c[0].to_i}"
	# post
	d=c[1].split("Posts")
	puts "\s\sPost \t\t: #{d[0].to_i}"
end
instagrab()
