class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.all.order(created_at: "desc")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = "新規登録に成功しました。"
      redirect_to tweets_path
    else
      flash[:alert] = "新規登録に失敗しました。"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      flash[:notice] = "編集に成功しました。"
      redirect_to tweets_path
    else
      flash[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    flash[:notice] = "削除に成功しました。"
    redirect_to tweets_path
  end

  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
