class Participants::IndexPage < MainLayout
  needs participants : ParticipantQuery
  quick_def page_title, "All Participants"

  def content
    h1 "All Participants"
    link "New Participant", to: Participants::New
    render_participants
  end

  def render_participants
    ul do
      @participants.each do |participant|
        li do
          link participant.prenom, Participants::Show.with(participant)
        end
      end
    end
  end
end
