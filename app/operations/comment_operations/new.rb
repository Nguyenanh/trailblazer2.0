class CommentOperations::New < Trailblazer::Operation
  step Policy::Pundit( CommentPolicy, :new? )
  step Model( Comment, :new )
  failure :errors
  private

  def errors(options, params:, **)
    raise Pundit::NotAuthorizedError if options['result.policy.default'].failure?
  end

end
