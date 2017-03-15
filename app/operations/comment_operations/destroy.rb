class CommentOperations::Destroy < Trailblazer::Operation
  step Policy::Pundit( CommentPolicy, :destroy? )
  step Model( Comment, :find_by )
  step :comment_destroy
  failure :errors

  private
  def errors(options, params:, **)
    raise Pundit::NotAuthorizedError if options['result.policy.default'].failure?
    raise ActiveRecord::RecordInvalid if options['result.model'].failure?
  end

  def comment_destroy(options, params:, **)
    options['model'].destroy
  end
end
