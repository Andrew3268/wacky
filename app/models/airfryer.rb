class Airfryer < ApplicationRecord
  has_and_belongs_to_many :tags

  after_create do
    airfryer = Airfryer.find_by(id: self.id)
    af_hashtags = self.af_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    af_hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        airfryer.tags << tag
    end
  end
  
  before_update do
    airfryer = Airfryer.find_by(id: self.id)
    airfryer.tags.clear
    af_hashtags = self.af_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    af_hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        airfryer.tags << tag
    end
  end
end



