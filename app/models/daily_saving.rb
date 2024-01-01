class DailySaving < ApplicationRecord
  acts_as_punchable

  belongs_to :user
  has_and_belongs_to_many :tags

  after_create do
    daily_saving = DailySaving.find_by(id: self.id)
    ds_hashtags = self.ds_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    ds_hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        daily_saving.tags << tag
    end
  end
  
  before_update do
    daily_saving = DailySaving.find_by(id: self.id)
    daily_saving.tags.clear
    ds_hashtags = self.ds_hashtag.scan(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/)
    ds_hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        daily_saving.tags << tag
    end
  end
end
