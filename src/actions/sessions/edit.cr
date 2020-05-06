class Sessions::Edit < BrowserAction
  route do
    session = SessionQuery.find(session_id)
    html EditPage,
      operation: SaveSession.new(session),
      session: session
  end
end
