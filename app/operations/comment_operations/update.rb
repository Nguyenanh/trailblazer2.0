class CommentOperations::Update < CommentOperations::Edit
  step Contract::Build( constant: CommentContracts::Create )
  step Contract::Validate(key: "comment")
  step Contract::Persist()
end
