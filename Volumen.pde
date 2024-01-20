
/*
 * Clase para representar un tamaño en la pantalla del programa.
 */
public class Volumen extends Dimension {
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Volumen(int x, int y) {
        super(x, y);
    }
    
    public int getAnchura() {
        return super.x;
    }
    
    public int getAltura() {
        return super.y;
    }
}