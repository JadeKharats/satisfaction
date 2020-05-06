class Sessions::New < BrowserAction
  route do
    html NewPage, operation: SaveSession.new
  end
end
