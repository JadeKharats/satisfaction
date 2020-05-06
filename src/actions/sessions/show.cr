class Sessions::Show < BrowserAction
  route do
    html ShowPage, session: SessionQuery.find(session_id)
  end
end
