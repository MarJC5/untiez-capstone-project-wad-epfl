class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post

    @comment.user = User.friendly.find(session[:user_id])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: I18n.t('comment.alert.create') }
        format.js
      else
        format.html { redirect_to @post, notice: I18n.t('comment.alert.create_error') }
      end
    end
  end

  private

    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end
end
