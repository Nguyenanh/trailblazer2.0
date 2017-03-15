class CommentContracts::Create < Reform::Form
  property :body
  validates :body, presence: true
end
