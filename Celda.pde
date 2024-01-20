/*
 * Clase para representar una Celda en el grid del juego.
 */
public class Celda extends ElementoInterfaz {
  
    // Campos de la clase
    protected final AlmacenRecursos almacen;
    protected final PaletaColores paletaColores;
    protected String id;
    protected boolean seleccionada;
    protected boolean activa;
    protected Runnable accion;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Celda(Volumen volumen, Coordenada posicion, AlmacenRecursos almacen,
            PaletaColores paletaColores, String id) {
              
        super(volumen, posicion);
        this.almacen = almacen;
        this.paletaColores = paletaColores;
        this.id = id;
        this.activa = false;
        this.seleccionada = false;
    }
    
    /*
     * Método que devuelve el identificador de esta celda.
     */
    public String getId() {
        return this.id;
    }
    
    /*
     * Método que indica si esta celda se encuentra activa.
     */
    public boolean activa() {
        return this.activa;
    }
    
    /*
     * Método que establece el estado de activación de esta celda.
     */
    public void activacion(boolean activa) {
        this.activa = activa;
    }
    
    /*
     * Método que indica si esta celda se encuentra seleccionada.
     */
    public boolean seleccionada() {
        return this.seleccionada;
    }
    
    /*
     * Método que activa la selección de esta celda.
     */
    public void seleccionar() {
        this.seleccionada = true;
    }
    
    /*
     * Método que desactiva la selección de esta celda.
     */
    public void deseleccionar() {
        this.seleccionada = false;
    }
    
    /*
     * Método que establece la acción de esta celda.
     */
    public void setAccion(Runnable accion) {
        this.accion = accion;
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos la celda en el grid.
     */
    @Override
    public void mostrar() {
        // Establecemos el color de trazado
        if (this.activa == true)
            stroke(this.paletaColores.azul, 100);
        else
            stroke(this.paletaColores.azul, 50);
            
        // Establecemos el color de fondo
        if (this.seleccionada == true)
            if (this.activa == true)
                fill(this.paletaColores.azulClaro, 120);
            else
                fill(this.paletaColores.azulClaro, 50);
        else
            fill(this.paletaColores.grisClaro, 0);
            
        rect(
            super.posicion.getPosicionHorizontal(), // Posición X
            super.posicion.getPosicionVertical(),   // Posición Y
            this.volumen.getAnchura(), // Anchura
            this.volumen.getAltura()   // Altura
        );
        
        // Dibujamos un punto en el centro de la celda, si ya ha sido seleccionada
        if (this.seleccionada == true) {
            if (this.activa == true) {
                stroke(this.paletaColores.grisOscuro); // Color de trazado
                fill(this.paletaColores.grisOscuro); // Color de relleno
            } else {
                stroke(this.paletaColores.grisOscuro, 80); // Color de trazado
                fill(this.paletaColores.grisOscuro, 80); // Color de relleno
            }
                
            circle(
                super.posicion.getPosicionHorizontal() + (this.volumen.getAnchura() / 2), // Posición X
                super.posicion.getPosicionVertical() + (this.volumen.getAltura() / 2),   // Posición Y
                4  // Radio
            );
        }
    }
    
    /*
     * Método que muestra la celda en el grid, con el estado de activacion indicado.
     */
    public void mostrar(boolean activa) {
        this.activacion(activa);
        this.mostrar();
    }
    
    /*
     * Método que sobrescribe de ElementoInterfaz para ejecutar la acción de esta celda.
     */
    @Override
    public void mouseActivado() {
        // Si se pulsa la celda y existe una acción definida,
        // la ejecutamos y emitimos el sonido
        if (mouseIn() && this.accion != null && !this.seleccionada) {
            this.accion.run();
            this.almacen.getEfecto().play();
        }
    }
}
