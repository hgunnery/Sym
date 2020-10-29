class CreateCores < ActiveRecord::Migration[6.0]
  def change
    create_table :cores do |t|
			t.string :homepage_title
      t.text :homepage_content
      t.string :homepage_banner
			t.text :homepage_about
			t.string :homepage_avatar
			t.boolean :sm_youtube, default: false
			t.boolean :sm_twitter, default: false
			t.boolean :sm_facebook, default: false
			t.boolean :sm_instagram, default: false
			t.string :sm_youtube_link
			t.string :sm_twitter_link
			t.string :sm_facebook_link
			t.string :sm_instagram_link

      t.timestamps
    end
		Core.create homepage_title: "Welcome to your Sym Membership app, please login",
			homepage_content: "Welcome to your new app, this is just some holding text ready and waiting for you to customise it once you have logged in. So why waste time, log in, take a look around and have a play!",
			homepage_banner: "",
			homepage_about: "You will want to put all of the information about your activitied in here, this is your detailed shop window!",
			homepage_avatar: "",
			sm_youtube_link: "http://youtube.com",
			sm_twitter_link: "http://twitter.com",
			sm_facebook_link: "http://facebook.com",
			sm_instagram_link: "http://instagram.com"
  end
end
