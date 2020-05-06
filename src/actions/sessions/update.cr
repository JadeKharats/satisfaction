class Sessions::Update < BrowserAction
  route do
    session = SessionQuery.find(session_id)
    SaveSession.update(session, params) do |operation, session|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(session.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, session: session
      end
    end
  end
end
