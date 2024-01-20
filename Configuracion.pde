import processing.sound.*;

/*
 * Clase para almacenar las opciones de configuración del programa.
 */
public class Configuracion {
  
    private final AlmacenRecursos almacen;
    private boolean musica1Seleccionada;
    private boolean musica2Seleccionada;
    private boolean imagen1Seleccionada;
    private boolean imagen2Seleccionada;
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public Configuracion(AlmacenRecursos almacen) {
        this.almacen = almacen;
        this.musica1Seleccionada = false;
        this.musica2Seleccionada = false;
        this.imagen1Seleccionada = false;
        this.imagen2Seleccionada = false;
    }
    
    /**
     * Método que indica si se ha configurado la música 1.
     */
    public boolean musica1Seleccionada() {
        return musica1Seleccionada;
    }
    
    /**
     * Método que establece en el programa la música 1.
     */
    public void seleccionarMusica1(boolean seleccion) {
        this.musica1Seleccionada = seleccion;
        
        if (seleccion == true) {
            // Arrancamos la música 1
            this.almacen.getSonido("sound1").loop();
            
        } else {
            // Paramos la música 1 (si está activa)
            if (this.almacen.getSonido("sound1").isPlaying())
                this.almacen.getSonido("sound1").stop();
        }
    }
    
    /**
     * Método que indica si se ha configurado la música 2.
     */
    public boolean musica2Seleccionada() {
        return musica2Seleccionada;
    }
    
    /**
     * Método que establece en el programa la música 2.
     */
    public void seleccionarMusica2(boolean seleccion) {
        this.musica2Seleccionada = seleccion;
        
        if (seleccion == true) {
            // Arrancamos la música 1
            this.almacen.getSonido("sound2").loop();
            
        } else {
            // Paramos la música 2 (si está activa)
            if (this.almacen.getSonido("sound2").isPlaying())
                this.almacen.getSonido("sound2").stop();
        }
    }
    
    /**
     * Método que indica si se ha configurado la imagen 1.
     */
    public boolean imagen1Seleccionada() {
        return imagen1Seleccionada;
    }
    
    /**
     * Método que establece en el programa la imagen 1.
     */
    public void seleccionarImagen1(boolean seleccion) {
        this.imagen1Seleccionada = seleccion;
    }
    
    /**
     * Método que indica si se ha configurado la imagen 2.
     */
    public boolean imagen2Seleccionada() {
        return imagen2Seleccionada;
    }
    
    /**
     * Método que establece en el programa la imagen 2.
     */
    public void seleccionarImagen2(boolean seleccion) {
        this.imagen2Seleccionada = seleccion;
    }
}
