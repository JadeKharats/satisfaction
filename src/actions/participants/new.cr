class Participants::New < BrowserAction
  route do
    html NewPage, operation: SaveParticipant.new
  end
end
