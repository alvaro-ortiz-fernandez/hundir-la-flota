/*
 * Clase para establecer las reglas de un juego en base a una dificultad.
 */
public class Dificultad {
  
    // Campos de la clase
    private final ArrayList<ConfiguracionBarco> configuraciones;
    private final int columnas;
    private final int filas;
    
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto).
     */
    public Dificultad() {
        Dificultad dificultad = obtenerDificultadAleatoria();
        this.configuraciones = dificultad.getConfiguraciones();
        this.columnas = dificultad.getColumnas();
        this.filas = dificultad.getFilas();
    }

    /*
     * Constructor privado de la clase, sólo invocable desde esta clase.
     */
    private Dificultad(ArrayList<ConfiguracionBarco> configuraciones, int columnas, int filas) {
        this.configuraciones = configuraciones;
        this.columnas = columnas;
        this.filas = filas;
    }
    
    /*
     * Método que devuelve las configuraciones de barcos de esta dificultad.
     */
    public ArrayList<ConfiguracionBarco> getConfiguraciones() {
        return this.configuraciones;
    }
    
    /*
     * Método que devuelve el Nº de columnas de esta dificultad.
     */
    public int getColumnas() {
        return this.columnas;
    }
    
    /*
     * Método que devuelve el Nº de filas de esta dificultad.
     */
    public int getFilas() {
        return this.filas;
    }
    
    /*
     * Método privado que devuelve una configuración aleatoria.
     */
    private Dificultad obtenerDificultadAleatoria() {
        // Generamos un valor aleatorio de 1 a 5
        switch(floor(random(1, 6))) {
            case 1:  return dificultad_muyBaja();
            case 2:  return dificultad_baja();
            case 3:  return dificultad_media();
            case 4:  return dificultad_alta();
            case 5:
            default: return dificultad_muyAlta();
        }
    }
    
    
    /*
     * Método privado que devuelve la configuración con dificultad muy baja.
     * Contiene una rejilla 5x5 con:
     *     - 2 barcos de 3 celdas
     */
    private Dificultad dificultad_muyBaja() {
        ArrayList<ConfiguracionBarco> configuraciones = new ArrayList<>();
        
        configuraciones.add(new ConfiguracionBarco(2, 3));
        
        return new Dificultad(configuraciones, 5, 5);
    }
    
    /*
     * Método privado que devuelve la configuración con dificultad baja.
     * Contiene una rejilla 7x7 con:
     *     - 3 barcos de 3 celdas
     *     - 2 barcos de 2 celdas
     */
    private Dificultad dificultad_baja() {
        ArrayList<ConfiguracionBarco> configuraciones = new ArrayList<>();
        
        configuraciones.add(new ConfiguracionBarco(3, 3));
        configuraciones.add(new ConfiguracionBarco(2, 2));
        
        return new Dificultad(configuraciones, 7, 7);
    }
    
    /*
     * Método privado que devuelve la configuración con dificultad media.
     * Contiene una rejilla 9x9 con:
     *     - 3 barcos de 3 celdas
     *     - 3 barcos de 2 celdas
     *     - 1 barco de 1 celda
     */
    private Dificultad dificultad_media() {
        ArrayList<ConfiguracionBarco> configuraciones = new ArrayList<>();
        
        configuraciones.add(new ConfiguracionBarco(3, 3));
        configuraciones.add(new ConfiguracionBarco(3, 2));
        configuraciones.add(new ConfiguracionBarco(1, 1));
        
        return new Dificultad(configuraciones, 9, 9);
    }
    
    /*
     * Método privado que devuelve la configuración con dificultad alta.
     * Contiene una rejilla 12x12 con:
     *     - 2 barcos de 3 celdas
     *     - 4 barcos de 2 celdas
     *     - 2 barcos de 1 celda
     */
    private Dificultad dificultad_alta() {
        ArrayList<ConfiguracionBarco> configuraciones = new ArrayList<>();
        
        configuraciones.add(new ConfiguracionBarco(2, 3));
        configuraciones.add(new ConfiguracionBarco(4, 2));
        configuraciones.add(new ConfiguracionBarco(2, 1));
        
        return new Dificultad(configuraciones, 12, 12);
    }
    
    /*
     * Método privado que devuelve la configuración con dificultad muy alta.
     * Contiene una rejilla 15x15 con:
     *     - 1 barco de 3 celdas
     *     - 4 barcos de 2 celdas
     *     - 5 barcos de 1 celda
     */
    private Dificultad dificultad_muyAlta() {
        ArrayList<ConfiguracionBarco> configuraciones = new ArrayList<>();
        
        configuraciones.add(new ConfiguracionBarco(1, 3));
        configuraciones.add(new ConfiguracionBarco(4, 2));
        configuraciones.add(new ConfiguracionBarco(5, 1));
        
        return new Dificultad(configuraciones, 15, 15);
    }
}
