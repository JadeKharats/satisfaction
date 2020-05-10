class Sessions::ShowPage < MainLayout
  needs session : Session
  quick_def page_title, "Session with id: #{@session.id}"

  def content
    render_formation_informations
    render_participants_informations
  end

  private def render_participants_informations
    div(class: "card") do
      render_participants_header
      render_participants_content
      render_participants_footer
    end
  end

  private def render_participants_content
    div class: "card-content" do
      div class: "content" do
        tag "table", class: "table" do
          tag "thead" do
            tag "tr" do
              tag "td" do
                text "Nom complet"
              end
              tag "td" do
                text "code individuel"
              end
              tag "td" do
                text "Actions"
              end
            end
          end
          tag "tbody" do
            @session.participants.each do |participant|
              tag "tr" do
                tag "td" do
                  text "#{participant.complete_name}"
                end
                tag "td" do
                  text "#{participant.code}"
                end
                tag "td" do
                  div class: "field has-addons" do
                    tag "p", class: "control" do
                      link "Modifier", Participants::Edit.with(participant.id), class: "button is-primary"
                    end
                    tag "p", class: "control" do
                      link "Supprimer", Participants::Delete.with(participant.id), class: "button is-danger"
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  private def render_participants_footer

  end

  private def render_participants_header
    tag("header", class: "card-header") do
      tag("p", class: "card-header-title") do
        text "Participants"
      end
    end
  end

  private def render_formation_informations
    div(class: "card") do
      render_header
      render_content
      render_footer
    end
  end

  private def render_header
    tag("header", class: "card-header") do
      tag("p", class: "card-header-title") do
        text "#{@session.intitule}"
      end
    end
  end

  private def render_content
    div class: "card-content" do
      div class: "content" do
        render_session_fields
      end
    end
  end

  private def render_footer
    tag("footer", class: "card-footer") do
      link "Modifier",
        Sessions::Edit.with(@session.id),
        class: "card-footer-item"
      link "Supprimer",
        Sessions::Delete.with(@session.id),
        data_confirm: "Are you sure?",
        class: "card-footer-item"
    end
  end

  def render_session_fields
    ul do
      li do
        text "formateur: "
        strong @session.formateur.to_s
      end
      li do
        text "Date de début: "
        strong @session.begin_date.to_s
      end
      li do
        text "Date de fin: "
        strong @session.end_date.to_s
      end
      li do
        text "uid: "
        strong @session.uid.to_s
      end
    end
  end
end
