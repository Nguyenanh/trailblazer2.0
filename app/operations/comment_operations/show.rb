class CommentOperations::Show < Trailblazer::Operation
  step Policy::Pundit( CommentPolicy, :show? )
  step Model( Comment, :find_by )
  failure :errors
  private

  def errors(options, params:, **)
    raise Pundit::NotAuthorizedError if options['result.policy.default'].failure?
    raise ActiveRecord::RecordInvalid if options['result.model'].failure?
  end

end
