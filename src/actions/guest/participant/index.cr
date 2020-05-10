class Guest::Participant::Index < BrowserAction
  include Auth::AllowGuests
  route do
    plain_text "Render something in Guest::Participant::Index"
  end
end
