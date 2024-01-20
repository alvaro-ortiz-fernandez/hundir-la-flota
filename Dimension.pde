/*
 * Clase base para representar cualidades compuestas por dos valores enteros.
 */
public abstract class Dimension {
  
    // Campos de la clase
    protected final int x;
    protected final int y;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Dimension(int x, int y) {
        this.x = x;
        this.y = y;
    }
}