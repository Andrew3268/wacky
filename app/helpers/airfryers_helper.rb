module AirfryersHelper
  def render_with_afhashtags(af_hashtag)
    af_hashtag.gsub(/[#＃][a-z|A-Z|가-힣|0-9|\w]+/){|word| link_to word, "/airfryers/af_hashtags/#{word.delete('#')}"}.html_safe
  end 
end
