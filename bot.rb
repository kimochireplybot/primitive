# coding: utf-8
require 'twitter'

# なんかクライアント系は全部グローバルの設定で問題ないでしょう
# こっちでツイートします
$client = Twitter::REST::Client.new do |config|
  config.consumer_key =        ENV['CONSUMER_KEY']
  config.consumer_secret =     ENV['CONSUMER_SECRET']
  config.access_token =        ENV['ACCESS_TOKEN']
  config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
end

=begin
# こっちでTLを読み込みます
$stream_client = Twitter::Streaming::Client.new do |config|
  config.consumer_key =        "CONSUMER_KEY"
  config.consumer_secret =     "CONSUMER_SECRET"
  config.access_token =        "ACCESS_TOKEN"
  config.access_token_secret = "ACCESS_TOKEN_SECRET"
end
=end

# tweetのテストコードです
$client.update("REST client working!!")

=begin
# Tweetへのリプライに使います
def reply(tweet)
  $client.update("@#{tweet.user.screen_name}\nおめでとうございます！", option = {:in_reply_to_status_id => tweet.id})
  $client.favorite(tweet.id)
end

# TL読み込みのテストコードです
$stream_client.user do |tweet|
  if tweet.is_a?(Twitter::Tweet)
    puts(tweet.user.name)
    puts("@#{tweet.user.screen_name}")
    puts(tweet.text)
    puts("----------")
    # これだとreplyをもらったときにも引っかかっちゃうので、正規表現部分を何とかします
    if /それな$/ =~ tweet.text
      reply(tweet)
    end
  end
end
=end
