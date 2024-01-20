/*
 * Clase para mostrar los elementos que permiten la navegación a otras pantallas del programa.
 */
public class PantallaCarga extends Pantalla {
  
    // Campos de la clase
    private final Spinner spinner;
    private boolean completada;
  
    /*
     * Constructor de la clase, para inicializar una instancia (crear un objeto)
     */
    public PantallaCarga(final Volumen volumen, final Reloj reloj,
            final AlmacenRecursos almacen, final Configuracion configuracion,
            final Navegacion navegacion, final PaletaColores paletaColores) {
              
        // Invocamos al constructor padre
        super(volumen, reloj, navegacion, almacen, configuracion, paletaColores);
        
        this.spinner = new Spinner(
            new Volumen(300, 300), // Anchura y altura
            new Coordenada(450, 450), // Posición
            paletaColores
        );
        this.completada = false;
    }
    
    /*
     * Método que implementa para ElementoInterfaz en el que mostramos
     * los distintos elementos de navegación que permite el programa.
     */
    @Override
    public void mostrar() {
        // Si el almacén ha finalizado su carga, pasamos a la pantalla de menú
        if (super.almacen.cargado()) {
            if (!completada) {
                // Creamos las pantallas del juego
                navegacion.nuevaPantalla(new PantallaMenu(
                    new Volumen(1200, 1000), // Anchura y altura
                    reloj, almacen, configuracion, navegacion, paletaColores
                ));
                navegacion.nuevaPantalla(new PantallaJuego(
                    new Volumen(1200, 1000), // Anchura y altura
                    reloj, almacen, configuracion, navegacion, paletaColores
                ));
                navegacion.nuevaPantalla(new PantallaConfiguracion(
                    new Volumen(1200, 1000), // Anchura y altura
                    reloj, almacen, configuracion, navegacion, paletaColores
                ));
            }
    
            // Pasamos a la pantalla de menu
            navegacion.establecerPantalla("Menu");
            
        } else {
            // Cargamos la vista por defecto
            super.mostrar();
            
            // Mostramos el aviso de carga
            this.spinner.mostrar();
            
            // Mostramos el porcentaje de carga
            int porc = super.almacen.porcentajeCarga();
            fill(paletaColores.negro); // Color del texto
            textSize(32); // Tamaño del texto
            text(
                porc + "%", // Texto
                (porc < 10) ? 582 : 572, // Posición X
                461 // Posición Y
            );
        }
    }
    
    /*
     * Método que implementa para Pantalla para devolver el nombre identificador de ésta Pantalla.
     */
    @Override
    public String getIdPantalla() {
        return "Carga";
    }
}
