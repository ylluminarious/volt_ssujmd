# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    model :store
  
    before_action :require_login #, #only: :index
    
    def add_todo
      _todos << page._new_todo.to_h
      page._new_todo._label =""
    end

    def incomplete
      _todos.count {|t| !t._completed }
    end

    def current_index
      params._index.to_i
    end

    def current_todo
      _todos[current_index]
    end

    def add_description
      _descriptions << page._new_description.to_h
    end

    def add_inscrito
      
      _inscritos << page._new_inscrito.to_h
      page._new_inscrito._label = ""
    end

    def send_message
      store._messages << page._form 
      reset_message
    end

    def reset_message
      page._form = Message.new
    end

    def admin

    end

    def index
      # Add code for when the index view is loaded
     reset_message 

    end

    def about
      # Add code for when the about view is loaded
    end

    def chat
      reset_message
    end

        
    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
