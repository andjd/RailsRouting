class CommentsController < ApplicationController
  def show
    render json: Comment.find(params[:id])
  end

  def create
    comment = Comment.new(comment_params)

    if comment.save
      render json: comment
    else
      render_errors(comment)
    end
  end

  def update
    comment = Comment.find(params[:id])

    if comment.save
      render json: comment
    else
      render_errors(comment)
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    if comment.destory
      render text: "Comment #{params[:id]} deleted"
    else
      render_errors(comment)
    end
  end

  def index

    if params[:contact_id]
      type = 'Contact'
      commentable_id = params[:contact_id]
    elsif params[:user_id]
      type = 'User'
      commentable_id = params[:user_id]
    end
    render json: Comment.where(commentable_type: type, commentable_id: commentable_id)    
  end

  private
    def render_errors(comment)
      render json: (
        comment.errors.full_messages, status: :unprocessable_entity
      )
    end

    def comment_params
      params[:comment].permit(:commenter_id, :commentable_id)
    end
end
