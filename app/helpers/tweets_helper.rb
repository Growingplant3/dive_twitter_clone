module TweetsHelper
  def choice_path
    if action_name == "new" || action_name == "create" || action_name == "confirm"
      confirm_tweets_path
    elsif action_name == "edit"
      tweet_path
    end
  end
end
