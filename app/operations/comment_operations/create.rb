class CommentOperations::Create < Trailblazer::Operation
  step Policy::Pundit( CommentPolicy, :create? )
  step Model( Comment, :new )
  step Contract::Build( constant: CommentContracts::Create )
  step Contract::Validate(key: "comment")
  step Contract::Persist()
  failure :errors

  private
  def errors(options, params:, **)
    raise Pundit::NotAuthorizedError if options['result.policy.default'].failure?
  end
end
