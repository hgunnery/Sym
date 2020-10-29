FactoryBot.define do
  factory :core do
		id { 1 }
		homepage_title { "Welcome to your Sym Membership app, please login" }
		homepage_content { "Welcome to your new app, this is just some holding text ready and waiting for you to customise it once you have logged in. So why waste time, log in, take a look around and have a play!" }
		homepage_about { "You will want to put all of the information about your activitied in here, this is your detailed shop window!" }
		sm_youtube_link { "http://youtube.com" }
		sm_twitter_link { "http://twitter.com" }
		sm_facebook_link { "http://facebook.com" }
		sm_instagram_link { "http://instagram.com" }
  end
end
