class PaisesController < ApplicationController
  def inicio
  	@paises = Pais.all 
  end
  def mostrar
  	@pais = Pais.find(params[:id]) 
  end
  def nuevo
  	@pais = Pais.new
  end
  def crear
    @pais = Pais.new(nombre: params[:pais][:nombre],
    	description: params[:pais][:description])

    respond_to do |format|
      if @pais.save
        format.html { redirect_to paises_inicio_path, notice: 'Pais creado exitosamente' }
      else
        format.html { render :nuevo }
      end
    end
  end
  def editar
    @pais = Pais.where('id = ?', params[:id]).first
  end
  def actualizar
    @pais = Pais.find(params[:pais][:id])
    respond_to do |format|
      if @pais.update(nombre: params[:pais][:nombre],
    	description: params[:pais][:description])
        format.html { redirect_to mostrar_pais_path(@pais.id), notice: 'Pais actualizando exitosamente' }
      else
        format.html { render :nuevo }
      end
    end
  end
def eliminar
      @pais = Pais.find(params[:id])
      respond_to do |format|
      if @pais.destroy
        format.html { redirect_to paises_inicio_path, notice: 'Pais eliminado exitósamente' }
      else
        format.html { redirect_to paises_inicio_path, notice: 'Pais no se pudo eliminar' }
      end
    end
  end  
end
