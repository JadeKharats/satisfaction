class Sessions::IndexPage < MainLayout
  needs sessions : SessionQuery
  quick_def page_title, "All Sessions"

  def content
    h1 "Toutes les sessions"
    render_sessions
  end

  def render_sessions
    @sessions.each do |session|
      div class: "card" do
        link "#{session.complete_name} ( #{session.participants.size} participants)  ", Sessions::Show.with(session)
      end
    end
  end
end
