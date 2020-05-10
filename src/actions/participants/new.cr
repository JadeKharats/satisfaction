class Participants::New < BrowserAction
  param session_id : Int64 = 1.to_i64
  route do
    html NewPage, operation: SaveParticipant.new(session_id: session_id)
  end
end
