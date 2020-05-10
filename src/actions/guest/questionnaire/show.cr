class Guest::Questionnaire::Show < BrowserAction
  include Auth::AllowGuests
  route do
    plain_text "Render something in Guest::Questionnaire::Show"
  end
end
