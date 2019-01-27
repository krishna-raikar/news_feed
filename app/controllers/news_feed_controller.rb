class NewsFeedController < ApplicationController
  PAGE_SIZE = 50 # Can be the app setting for future enhancement.
  DEFAULT_PAGE = 1 # Default to first page.
  # JSON endpoint that returns an array of Post objects in order of
  # newest first, to oldest last. Each Post contains a User object
  # (the author of the Post), and an array of Comments. Each Comment
  # will also include the User object of the Comment's author.

  def index
    begin 
      respond_to do |format|
        @posts = Post.page(current_page).per(default_page_size).includes(:user, comments: :user).order(created_at: :desc)
        format.json  { render json: @posts }
      end
    rescue => e
      format.json  { render json: [] }
    end
  end

  private

  def default_page_size
    params[:per_page] || PAGE_SIZE
  end

  def current_page
    params[:page] || DEFAULT_PAGE
  end
end
