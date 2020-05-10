class Participants::Index < BrowserAction
  route do
    html IndexPage, participants: ParticipantQuery.new
  end
end
