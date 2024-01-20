/*
 * Clase para representar una posición en la pantalla del programa.
 */
public class Coordenada extends Dimension {
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Coordenada(int x, int y) {
        super(x, y);
    }
    
    public int getPosicionHorizontal() {
        return super.x;
    }
    
    public int getPosicionVertical() {
        return super.y;
    }
}