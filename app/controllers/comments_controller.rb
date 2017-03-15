class CommentsController < ApplicationController

  def index
    @comments = run CommentOperations::Index
  end

  def show
    @comment = run CommentOperations::Show
  end

  def new
    @comment = run CommentOperations::New
  end

  def edit
    @comment = run CommentOperations::Edit
  end

  def create
    @comment = run CommentOperations::Create
    if @comment.success?
      redirect_to @comment['model']
    else
      render :new
    end
  end

  def update
    @comment = run CommentOperations::Update
    if @comment.success?
      redirect_to @comment['model']
    else
      render :edit
    end
  end

  def destroy
    run CommentOperations::Destroy
    redirect_to comments_path
  end

end
