class Guest::Session::Index < BrowserAction
  include Auth::AllowGuests
  param session_code : String?
  route do
    session = SessionQuery.new.uid(session_code.not_nil!).first?
    if session
      html IndexPage, name: session.intitule
    else
      redirect to: Home::Index
    end
  end
end
