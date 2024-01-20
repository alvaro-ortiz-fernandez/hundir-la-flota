/*
 * Clase para implementar un botón en el programa.
 *
 * Diseñada a partir del ejemplo de botón de la documentación de processing
 * (https://processing.org/examples/button.html).
 */
public class Boton extends ElementoInterfaz {
  
    // Campos de la clase
    protected final String btn;
    protected final String btnAlternativo;
    protected final Runnable accion;
    protected final AlmacenRecursos almacen;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Boton(String btn, PImage imgBtn, String btnAlternativo, PImage imgBtnAlternativo,
            Volumen volumen, Coordenada posicion, Runnable accion, AlmacenRecursos almacen) {
        super(volumen, posicion);
        
        super.nuevaVista(btn, imgBtn);
        super.nuevaVista(btnAlternativo, imgBtnAlternativo);

        this.btn = btn;
        this.btnAlternativo = btnAlternativo;
        this.accion = accion;
        this.almacen = almacen;
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * el botón con las propiedades definidas en su constructor.
     */
    @Override
    public void mostrar() {
        // Pintamos el el botón en pantalla
        if (mouseIn())
            // Si el ratón está sobre el botón, mostramos la vista alternativa
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
        // y emitimos un sonido aleatorio
        if (mouseIn()) {
            this.accion.run();
            this.almacen.getEfecto().play();
        }
    }
}
