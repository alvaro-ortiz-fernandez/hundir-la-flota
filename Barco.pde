/*
 * Clase para representar una Barco en el grid del juego.
 */
public class Barco extends ElementoInterfaz {
  
    // Campos de la clase
    protected final PaletaColores paletaColores;
    protected final ArrayList<Celda> celdas;
    private final int direccion;
    private boolean activo;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Barco(Volumen volumen, Coordenada posicion, PaletaColores paletaColores, int direccion) {
        super(volumen, posicion);
        this.paletaColores = paletaColores;
        this.celdas = new ArrayList();
        this.direccion = direccion;
    }
    
    /*
     * Método que devuelve las celdas de este barco.
     */
    public ArrayList<Celda> getCeldas() {
        return this.celdas;
    }
    
    /*
     * Método que añade una celda a este barco.
     */
    public void asignarCelda(Celda celda) {
        this.celdas.add(celda);
    }
    
    /*
     * Método que establece el estado de activación de este barco.
     */
    public void activo(boolean activo) {
        this.activo = activo;
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos el barco en el grid.
     */
    @Override
    public void mostrar() {
        strokeWeight(2); // Grosor de trazado
        
        if (this.hundido()) {
            // Si el barco está hundido, lo pintamos rojo
            if (this.activo) {
                stroke(this.paletaColores.rojo); // Color de trazado
                fill(this.paletaColores.rojoClaro, 150); // Color de fondo
            } else {
                stroke(this.paletaColores.rojo, 120); // Color de trazado
                fill(this.paletaColores.rojoClaro, 80); // Color de fondo
            }
        } else {
            // Si no está hundido, azul
            if (this.activo) {
                stroke(this.paletaColores.azul); // Color de trazado
                fill(this.paletaColores.azulClaro, 150); // Color de fondo
            } else {
                stroke(this.paletaColores.azul, 120); // Color de trazado
                fill(this.paletaColores.azulClaro, 80); // Color de fondo
            }
        }
      
        Celda celdaInicial = this.celdas.get(0);
            
        // Si sólo hay una celda, pintamos el barco con ella
        if (this.celdas.size() == 1) {
            rect(
                celdaInicial.getPosicion().getPosicionHorizontal(), // Posición X
                celdaInicial.getPosicion().getPosicionVertical(),   // Posición Y
                celdaInicial.getVolumen().getAnchura(), // Anchura
                celdaInicial.getVolumen().getAltura()   // Altura
            );
        } else {
            // Si hay varias celdas, pintamos el barco con la primera y la longitud
            if (this.direccion < 1) {
                // Hacia arriba
                rect(
                    celdaInicial.getPosicion().getPosicionHorizontal(),                       // Posición X
                    celdaInicial.getPosicion().getPosicionVertical()
                        - (celdaInicial.getVolumen().getAltura() * (this.celdas.size() - 1)), // Posición Y
                    celdaInicial.getVolumen().getAnchura(),                    // Anchura
                    celdaInicial.getVolumen().getAltura() * this.celdas.size() // Altura
                );
            } else if (this.direccion < 2) {
                // Hacia la derecha
                rect(
                    celdaInicial.getPosicion().getPosicionHorizontal(), // Posición X
                    celdaInicial.getPosicion().getPosicionVertical(),   // Posición Y
                    celdaInicial.getVolumen().getAnchura() * this.celdas.size(), // Anchura
                    celdaInicial.getVolumen().getAltura()                        // Altura
                );
            } else if (this.direccion < 3) {
                // Hacia abajo
                rect(
                    celdaInicial.getPosicion().getPosicionHorizontal(), // Posición X
                    celdaInicial.getPosicion().getPosicionVertical(),   // Posición Y
                    celdaInicial.getVolumen().getAnchura(),                    // Anchura
                    celdaInicial.getVolumen().getAltura() * this.celdas.size() // Altura
                );
            } else {
                // Hacia la izquierda
                rect(
                    celdaInicial.getPosicion().getPosicionHorizontal()
                        - (celdaInicial.getVolumen().getAnchura() * (this.celdas.size() - 1)), // Posición X
                    celdaInicial.getPosicion().getPosicionVertical(),                          // Posición Y
                    celdaInicial.getVolumen().getAnchura() * this.celdas.size(), // Anchura
                    celdaInicial.getVolumen().getAltura()                        // Altura
                );
            }
        }
    }
    
    /*
     * Método que indica si el barco indicado colisiona con este barco.
     */
    public boolean colisiona(Barco barco) {
        return this.celdas.stream()
                .anyMatch(celdaPropia -> barco.getCeldas().stream()
                    .anyMatch(celda -> celdaPropia.getId().equalsIgnoreCase(celda.getId())));
    }
    
    /*
     * Método que indica si este barco tiene todas sus celdas hundidas.
     */
    public boolean hundido() {
        return this.celdas.stream()
                .allMatch(celda -> celda.seleccionada());
    }
}
