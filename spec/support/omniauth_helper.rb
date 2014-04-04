module OmniauthHelper
  def mock_auth_linkedin
    OmniAuth::AuthHash.new(
    {"provider"=>"linkedin",
    "uid"=>"BuXMvzpm3r",
    "info"=>
    {"name"=>"Keith Webber",
    "email"=>"keith.e.webber@gmail.com",
    "nickname"=>"Keith Webber",
    "first_name"=>"Keith",
    "last_name"=>"Webber",
    "location"=>"Greater Boston Area, US",
    "description"=>"Ruby on Rails Apprentice at Launch Academy, Inc",
    "image"=>
    "http://m.c.lnkd.licdn.com/mpr/mprx/0_gnYAT9AKUUXtg_nV1rpmTv9tJj_GlhFVxlEmTvn86OB-mkrsAKmjfzGmcvij-F69yvyfm-kBPueC",
    "phone"=>nil,
    "headline"=>"Ruby on Rails Apprentice at Launch Academy, Inc",
    "industry"=>"Computer Software",
    "urls"=>{"public_profile"=>"http://www.linkedin.com/in/webberkeith"}},
    "raw_info"=>
    {"emailAddress"=>"keith.e.webber@gmail.com",
    "firstName"=>"Keith",
    "headline"=>"Ruby on Rails Apprentice at Launch Academy, Inc",
    "id"=>"BuXMvzpm3r",
    "industry"=>"Computer Software",
    "lastName"=>"Webber",
    "location"=>{"country"=>{"code"=>"us"}, "name"=>"Greater Boston Area"},
    "pictureUrl"=>
    "http://m.c.lnkd.licdn.com/mpr/mprx/0_gnYAT9AKUUXtg_nV1rpmTv9tJj_GlhFVxlEmTvn86OB-mkrsAKmjfzGmcvij-F69yvyfm-kBPueC",
    "publicProfileUrl"=>"http://www.linkedin.com/in/webberkeith"}}
    )
  end




end



