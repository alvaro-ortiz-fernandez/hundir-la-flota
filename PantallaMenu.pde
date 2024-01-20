/*
 * Clase para mostrar los elementos que permiten la navegación a otras pantallas del programa.
 */
public class PantallaMenu extends Pantalla {
  
    // Campos de la clase
    private final Boton botonJugar;
    private final Boton botonConfiguracion;
    private final Boton botonSalir;
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public PantallaMenu(final Volumen volumen, final Reloj reloj,
            final AlmacenRecursos almacen, final Configuracion configuracion,
            final Navegacion navegacion, final PaletaColores paletaColores) {
              
        // Invocamos al constructor padre
        super(volumen, reloj, navegacion, almacen, configuracion, paletaColores);
        
        // Inicializamos las variables de esta clase
        this.botonJugar = new Boton(
            "btn-jugar", super.almacen.getImagen("btn-jugar"), // Color normal
            "btn-jugar-hover", super.almacen.getImagen("btn-jugar-hover"), // Color oscurecido
            new Volumen(210, 46), // Tamaño
            new Coordenada(495, 400), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    reloj.resetear();
                    navegacion.establecerPantalla("Juego");
                }
            }, almacen
        );
        super.nuevoElemento(this.botonJugar);
        
        this.botonConfiguracion = new Boton(
            "btn-configuracion", super.almacen.getImagen("btn-configuracion"), // Color normal
            "btn-configuracion-hover", super.almacen.getImagen("btn-configuracion-hover"), // Color oscurecido
            new Volumen(210, 46), // Tamaño
            new Coordenada(495, 480), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    // Reiniciamos el cronómetro del programa
                    reloj.resetear();
                    navegacion.establecerPantalla("Configuracion");
                }
            }, almacen
        );
        super.nuevoElemento(this.botonConfiguracion);
        
        this.botonSalir = new Boton(
            "btn-salir", super.almacen.getImagen("btn-salir"), // Color normal
            "btn-salir-hover", super.almacen.getImagen("btn-salir-hover"), // Color oscurecido
            new Volumen(210, 46), // Tamaño
            new Coordenada(495, 560), // Posición
            // Acción a ajecutar al accionar el botón
            new Runnable() {
                @Override
                public void run() {
                    // Cerramos el programa
                    exit();
                }
            }, almacen
        );
        super.nuevoElemento(this.botonSalir);
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * los distintos elementos de navegación que permite el programa.
     */
    @Override
    public void mostrar() {
        // Cargamos la vista por defecto
        super.mostrar();
        
        // Mostramos los botones
        botonJugar.mostrar();
        botonConfiguracion.mostrar();
        botonSalir.mostrar();
    }
    
    /*
     * Método que implementa para Pantalla para devolver el nombre identificador de ésta Pantalla.
     */
    @Override
    public String getIdPantalla() {
        return "Menu";
    }
}
