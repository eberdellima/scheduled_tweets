class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    return if tweet.published?

    # to prevent rescheduling to earlier times
    return if tweet.published_at > Time.current

    tweet.publish_to_twitter!
  end
end
