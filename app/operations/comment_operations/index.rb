class CommentOperations::Index < Trailblazer::Operation
  step :model_all
  failure :errors
  private

  def model_all(options, params:, **)
    options["models"] = Comment.all
  end
end
