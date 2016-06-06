# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @positive = 10
    @negative = 25
    @neutral = 3
  end

  def search
    @tweets = Pnc::TwitterSearcher.search(params[:query])
    @positive = @tweets.count(&:positive?)
    @negative = @tweets.count(&:negative?)
    @neutral = @tweets.count(&:neutral?)
    render :index
  end

  def action_cable
  end
end
