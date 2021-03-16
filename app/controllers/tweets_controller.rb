# frozen_string_literal: true

# TweetsController documentation
class TweetsController < ApplicationController
  before_action :require_user_logged_in!
  before_action :set_tweet, only: %i[edit update destroy]

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweet_params)

    return redirect_to tweets_path, notice: 'Tweet created successfully' if @tweet.save

    render :new
  end

  def edit; end

  def update
    return redirect_to tweets_path, notice: 'Tweet updated successfully' if @tweet.update(tweet_params)

    render :edit
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: 'Tweet updated unscheduled'
  end

  private

  def tweet_params
    params.require(:tweet).permit(:twitter_account_id, :body, :published_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end
