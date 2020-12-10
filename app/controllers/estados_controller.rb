class EstadosController < ApplicationController
  def inicio
  	@estados = Estado.all #select * from estados
  end

  def mostrar
  	@estado = Estado.find(params[:id]) #select * from estados where estado_id=1;
  end

  def nuevo
  	@estado = Estado.new
    @paises = Pais.all
  end
  def crear
    @estado = Estado.new(nombre: params[:estado][:nombre],
    	descripcion: params[:estado][:descripcion],
    	pais_id: params[:estado][:pais_id])

    respond_to do |format|
      if @estado.save
        format.html { redirect_to estados_inicio_path, notice: 'Estado creado exitósamente' }
      else
        format.html { render :nuevo }
      end
    end
  end

  def editar
    @estado = Estado.where('id = ?', params[:id]).first
    @paises = Pais.all
  end

  def actualizar
    @estado = Estado.find(params[:estado][:id])
    respond_to do |format|
      if @estado.update(nombre: params[:estado][:nombre],
      descripcion: params[:estado][:descripcion],
      pais_id: params[:estado][:pais_id])
        format.html { redirect_to mostrar_estado_path(@estado.id), notice: 'Estado actualizandon exitosamente' }
      else
        format.html { render :nuevo }
      end
    end
  end

  def eliminar
      @estado = Estado.find(params[:id])
      respond_to do |format|
      if @estado.destroy
        format.html { redirect_to estados_inicio_path, notice: 'Estado eliminado exitósamente' }
      else
        format.html { redirect_to estados_inicio_path, notice: 'Estado no se pudo eliminar' }
      end
    end
  end
end
