class SecurityController < ApplicationController	
	def index
    if session[:state]
      redirect_to controller: "people" , action: "index"
    else
      if params[:error]
        @error = params[:error]
      end  
    end  
  end
  
  def logout
    if session[:state] 
      destroy
    end
    redirect_to controller: "security" , action: "index"
  end

  def login
    #sexo
    if authentic(params[:login], params[:password])
      redirect_to controller: "people" , action: "index"
    else
      redirect_to controller: "security" , action: "index" , error: "1"
    end
  end  

  def authentic(login, password)
    row = Person.all.where(login: login, password: password)
    if row.exists?
      row.each do |r|
        session[:id]=r.id
        session[:login] = r.login        
        session[:permission] = r.permission
      end
      session[:state] = true
      return true
    else
      #Por si no existe, colocar un error aqui, talvez un alert
      return false
    end
  end

  def destroy
    session.destroy
  end
end
