module ApplicationHelper
    #does this method work?
    def full_name(person)
        person.first_name + " " + person.last_name
    end


        #does any other view use this method
    def casting_office(project)
        project.casting_office.name
    end

end
