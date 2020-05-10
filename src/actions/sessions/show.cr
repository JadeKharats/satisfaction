class Sessions::Show < BrowserAction
  route do
    html ShowPage, session: SessionQuery.new.preload_participants.find(session_id)
  end
end
