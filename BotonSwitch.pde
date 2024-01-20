/*
 * Clase que extiende de Boton para definir un botón con estado [Seleccionado | No seleccionado].
 */
public class BotonSwitch extends Boton {
  
    // Campos de la clase
    private boolean seleccionado;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public BotonSwitch(String btn, PImage imgBtn, String btnAlternativo, PImage imgBtnAlternativo,
            Volumen volumen, Coordenada posicion, Runnable accion, AlmacenRecursos almacen) {
        super(btn, imgBtn, btnAlternativo, imgBtnAlternativo, volumen, posicion, accion, almacen);
        this.seleccionado = false;
    }
    
    /**
     * Método que marca la selección de este botón.
     */
    public void seleccionar(boolean seleccionar) {
        this.seleccionado = seleccionar;
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * el botón con las propiedades definidas en su constructor.
     */
    @Override
    public void mostrar() {
        // Pintamos el el botón en pantalla
        if (this.seleccionado == true)
            // Si el botón está activo, mostramos la vista alternativa
            super.mostrarVista(btnAlternativo);
        else
            super.mostrarVista(btn);
    }
    
    /*
     * Método que sobrescribe de ElementoInterfaz para ejecutar la acción de este botón.
     */
    @Override
    public void mouseActivado() {
        // Si se pulsa el botón, ejecutamos la acción definida para él
        if (mouseIn())
            this.accion.run();
    }
}
