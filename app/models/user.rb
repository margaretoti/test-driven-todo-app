class User
  def initialize(email)
    @email = email
  end

  def todos
    Todo.where(owner_email: @email)
  end

  def signed_in?
    @email.present? # nil does type checking- is it NULL;
    # present focuses on behavior of interface - do "" count for example
  end
end
