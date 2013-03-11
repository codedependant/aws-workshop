class Chirp < ActiveRecord::Base
  belongs_to :user

  attr_accessor :user_name
  attr_accessible :content, :user_id, :user_name


  indexed_with_cloud_search do |config|
    config.cloud_search_domain = "mydomain-s6ahpyqvjsznf4tn3vdpdnkgce"
  end

  def cloud_search_data
    {
      "user" => self.user_name,
      "content" => self.content
    }
  end
end
