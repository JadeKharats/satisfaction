class Users::Index < BrowserAction
  route do
    html IndexPage, users: UserQuery.new
  end
end
