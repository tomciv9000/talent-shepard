module ApplicationHelper
    
#    def full_name(person)
#        person.first_name.capitalize + " " + person.last_name.capitalize
#    end

        #does any other view use this method
#    def casting_office(resource)
#        resource.casting_office.name
#    end
#
#    def project_name(resource)
#        resource.project.name
#    end
#
#    def actor_name(resource)
#        full_name(resource.actor)
#    end
#
#    def role(resource)
#        resource.role.upcase
#    end


    def description_row(label, content)
        description_label(label) + description_content(content)
    end

    def small_text(content)
        content_tag(:small, content, class: ["form-text", "text-muted"])
    end

  


    private
    
    def description_label(label)
        content_tag(:dt, label, class: "col-sm-3") 
    end

    def description_content(content)
        content_tag(:dd, content, class: "col-sm-9")
    end

end
