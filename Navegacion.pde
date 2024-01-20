/*
 * Clase para controlar el cambio de pantallas en el programa.
 */
public class Navegacion {
  
    // Campos de la clase
    private final ArrayList<Pantalla> pantallas;
    private String pantallaActual;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Navegacion() {
        this.pantallas = new ArrayList<Pantalla>(); // Inicializamos la lista vacía
    }
    
    /*
     * Método que añade una pantalla a la navegación.
     */
    public void nuevaPantalla(Pantalla pantalla) {
        this.pantallas.add(pantalla);
    }
    
    /*
     * Método que devuelve la pantalla activa.
     */
    public String getPantallaActual() {
        return this.pantallaActual;
    }
    
    /*
     * Método que establece la pantalla a mostrar en el programa.
     */
    public void establecerPantalla(String idPantalla) {
        this.pantallaActual = idPantalla;
        this.mostrarPantalla();
    }
    
    /*
     * Método que muestra en el programa la pantalla actual.
     */
    public void mostrarPantalla() {
        // Recorremos las pantallas y mostramos la que coincida con el id indicado
        for (Pantalla pantalla : this.pantallas) {
            if (pantalla.getIdPantalla().equalsIgnoreCase(pantallaActual)) {
                pantalla.mostrar();
                break;
            }
        }
    }
    
    /*
     * Método que informa la navegación de que el puntero ha sido clickado.
     */
    public void mouseActivado() {
        // Por defecto no hacemos nada, sólo informamos a los elementos hijos
        for (Pantalla pantalla : this.pantallas)
            pantalla.mouseActivado();
    }
}