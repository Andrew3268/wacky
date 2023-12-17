module DailySavingsHelper
  def render_with_dshashtags(ds_hashtag)
    ds_hashtag.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "/daily_savings/ds_hashtags/#{word.delete('#')}"}.html_safe
  end 
end
