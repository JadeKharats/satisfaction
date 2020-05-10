class Guest::Session::Index < BrowserAction
  include Auth::AllowGuests
  param session_code : String?
  route do
    sessions = SessionQuery.new.uid(session_code.not_nil!)
    if sessions.size > 0
      html Guest::Session::IndexPage
    else
      redirect to: Home::Index
    end
  end
end
