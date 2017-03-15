class CommentOperations::Edit < Trailblazer::Operation
  step Policy::Pundit( CommentPolicy, :edit? )
  step Model( Comment, :find_by )
  failure :errors

  private
  def errors(options, params:, **)
    raise Pundit::NotAuthorizedError if options['result.policy.default'].failure?
    raise ActiveRecord::RecordInvalid if options['result.model'].failure?
  end

end
