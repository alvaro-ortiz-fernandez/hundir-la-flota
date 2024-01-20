/*
 * Clase para establecer la configuración de barcos en una dificultad.
 */
public class ConfiguracionBarco {
    
    // Campos de la clase
    private final int numBarcos;
    private final int longitud;
        
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public ConfiguracionBarco(int numBarcos, int longitud) {
        this.numBarcos = numBarcos;
        this.longitud = longitud;
    }
    
    /*
     * Método que indica el número de barcos en esta configuración.
     */
    public int getNumBarcos() {
        return this.numBarcos;
    }

    /*
     * Método que indica el Nº de celdas de cada barco en esta configuración.
     */        
    public int getLongitud() {
        return this.longitud;
    }
}
