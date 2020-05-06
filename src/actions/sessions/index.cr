class Sessions::Index < BrowserAction
  route do
    html IndexPage, sessions: SessionQuery.new
  end
end
