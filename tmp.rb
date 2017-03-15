step     Model( Comment, :new )
step     :assign_current_user!
step     Contract::Build()
step     Contract::Validate( )
failure  :log_error!
step     Contract::Persist(  )
